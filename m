Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0EDCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDssZKzypBLff+1ZVIfB58ENRKA3B3YlfDeq0xu5XOQ=; b=XxyRZm3XB7EWWiiH9e6KjLROzp
	GPfYSeWUbQ4DjxTuVlQliSBoXcyhZ2WI7vT3rV3vgmOkjBUYdwPxfOYIAFc9wSt5msWSqxKGsYqP0
	4YWBUmeVGjYvcaT89NHBDbnGD8Zxu8hy8I27QMiBWssUw/1mYNKtkSqLa++86tj7GphlCBzYAKBLZ
	XD+krRiylc+11h9PWK0K+QA9heRbb7Jo1u8prJSPo1zHZNmfpbs4VEwPqoXjzpOiHFvL3OW9yDa8m
	zT2w1huEHeGFUdpKV0kK+NGx/s9ub9KNXUmwEtCT5531x8kxzEbITopvYRS5zw9mhjekUg20TJBZL
	KIaStgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEryv-00000006PLj-0Nf8;
	Fri, 31 Oct 2025 16:28:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEryr-00000006PKX-0scH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:28:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-426fc536b5dso1579207f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761928079; x=1762532879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDssZKzypBLff+1ZVIfB58ENRKA3B3YlfDeq0xu5XOQ=;
        b=KRSWf4v/EPv8EPb/a5+5pgo09gLV5BBpmsT88rmMM7zsTiJXMwqdeJD3C8wnjK9FpL
         mUFPDYKwBeNErQCv10OkMybT6kka4hViF0i2o0D5VVkOsOX1e27aDLUlRBpXF1+nkM+E
         7RiCUSrn9YfIac3mO6CRNpdje0bPTNllD0qg4x+nUrRFQwELwSDYBcy4g+/zJAlyM1tQ
         X4UYqbz8JmAaXEVdb4DE8DbTHJ0hwYEJdt7/HV2OU6eThc7Z7Yxsxjcqb3JB8ttHx+X2
         MoUlhpkQT2Ec7ciYF4O0rXzhaQ5I1d6JAjcVctH3ZaQuSgL3b2scX3Fjw/j4w3W3MZKk
         0klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761928079; x=1762532879;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDssZKzypBLff+1ZVIfB58ENRKA3B3YlfDeq0xu5XOQ=;
        b=uaRFFJclyZP7NDd5BssNya3FqdKjh2Au+/zdGGvi4oROTglQeWTmdeFA56u8Y+QwVN
         MCrO+p0sTFVTAF/YUe7v0F/w/FRTuu3OEdh0kmrgWvrNTNraHti/X9hH+N1DK4PHJY+/
         /cH4OtkyHCNVPl3JBmrNerrcS+WkKyvW7jBlRiawufXBjmNOGISUiZS8WtTXLbl0iVS4
         KtnBD7Oc+D0cA+ytKew/jdvBa5YZEQPV49WUc70V08OrZLACgw7RG8Yf0wyYmLQ0tf6q
         S+FFscRHRS7R0S9Ugc4BsW1+NzAJJef5OI3zlDD6UZaU+AnkwBdX+mqvpKdu+M7MdXZl
         pOYg==
X-Forwarded-Encrypted: i=1; AJvYcCVQDSydPf1/wceJQ6Lue4Jw1MvIjnHMk96KFAspydLgeNwM+q5iYhhr3xFqluQ9mriSt59n7oF3LUPisR+EFyAd@lists.infradead.org
X-Gm-Message-State: AOJu0YzvX6C/PWTbcjuvrUV8cCJdNTEOmk43BFHZ2IF7wVHkufRBsy5c
	y4RiUnr/l0XCphuvXGzWSryxjH5K0b5XfGDbPgLa1Ll8vTdG1oO2SoH2/OLxdpVylF4=
X-Gm-Gg: ASbGnctKw6UXDaY5taoS2qSxTLhvm9tuO/qwlOnBg0zPC1j+SknTcfLc5nRYSy++M3/
	fEOC+Ieu1Xj5TApaaE0+0oJLQPwY9cv9UDJVwo93COX+FXIyTWxSa2OYhZ4aKprIHZGkkV7FRXr
	lhFhzt220n7eM5Q7z7VHgOgw8+uX0QMOTv5nGLJmwMm6du36/YG4AwXlTbfyWw37qLRJmnMSBDB
	+YZNbgixVeQ5CytN2fYKrw5xMms1xYqSwXDYtf6GNtZ+q7M1A1+dkRj680OR4fzzIukqpqltmTp
	mZGIfdcQ1OW1zf/V5uE84w7YLjPFCrtpoPoW/ZdPyq6XEZ3p4fPtPVcv+DvzLb/DtvPXimJ8mNs
	Ei/NsQWcBOBORQbEFjbOcITk1fJ0cLQsYX8ksGb/Gv4H6lpGDGebO0uEed9/LmfGujhxCs4jYaw
	4PHh1vLtResQ==
X-Google-Smtp-Source: AGHT+IFrsbEnwLrCCUR6Iu0VY5Uzhd0sq8qEcvcS/A9/eiqg3la7OAXHkma7L0rV7CnkzwdcPd10ig==
X-Received: by 2002:a05:6000:178f:b0:429:bb21:94e1 with SMTP id ffacd0b85a97d-429bd6a0caemr3886114f8f.41.1761928079286;
        Fri, 31 Oct 2025 09:27:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b8e9:e124:10fc:8444])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c112413esm4367494f8f.12.2025.10.31.09.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 09:27:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: amlogic: optimize the PLL driver
In-Reply-To: <9751014d-926e-4d42-b8e1-5a4d3e734457@amlogic.com> (Chuan Liu's
	message of "Fri, 31 Oct 2025 23:09:13 +0800")
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
	<1jms57xx05.fsf@starbuckisacylon.baylibre.com>
	<9751014d-926e-4d42-b8e1-5a4d3e734457@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Oct 2025 17:27:58 +0100
Message-ID: <1j5xbvxchd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_092801_270453_A0AB6461 
X-CRM114-Status: GOOD (  17.69  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri 31 Oct 2025 at 23:09, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome,
>
> On 10/31/2025 5:04 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Fri 31 Oct 2025 at 16:10, Chuan Liu via B4 Relay
>> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>=20
>>> This patch series consists of four topics involving the amlogic PLL
>>> driver:
>>> - Fix out-of-range PLL frequency setting.
>>> - Improve the issue of PLL lock failures.
>>> - Add handling for PLL lock failure.
>>> - Optimize PLL enable timing.
>>>
>>> For easier review and management, these are submitted as a single
>>> patch series.
>>>
>>> The PLL timing optimization changes were merged into our internal
>>> repository quite some time ago and have been verified on a large
>>> number of SoCs:
>>> - Already supported upstream: G12A, G12B, SM1, S4, A1, C3.
>>> - Planned for upstream support: T7, A5, A4, S7, S7D, S6, etc.
>>>
>>> Based on the upstream code base, I have performed functional testing
>>> on G12A, A1, A5, A4, T7, S7, S7D, and S6, all of which passed.
>>>
>>> Additionally, stress testing using scripts was conducted on A5 and
>>> A1, with over 40,000 and 50,000 iterations respectively, and no
>>> abnormalities were observed. Below is a portion of the stress test
>>> log (CLOCK_ALLOW_WRITE_DEBUGFS has been manually enabled):
>> Okay, this little game has been going on long enough.
>> You've posted v2 24h hours ago
>> You've got feedback within hours
>> There was still a 1 question pending
>> The rest of community had no chance to review.
>>=20
>
> There might be a serious misunderstanding here.
>
> In recent years, we've mainly been maintaining our code in our
> internal repository, which has led to some differences between our
> internal codebase and the upstream version. The patches that account
> for these differences are already queued for submission, and several
> SoCs are also waiting in line to be submitted. As a result, quite a
> few patches have piled up, waiting to go upstream.
>
> Previously, I had been waiting for your clock driver restructuring
> patches to be ready (which have recently been merged), so for almost
> a year, we haven't made much progress on clock driver=E2=80=93related
> upstreaming.

Ohoh now you are just teasing me !

That work was made necessary because of all the copy/paste Amlogic was
submitting. Despite many requests, this was never addressed so I had
to step in.

If you want things to go faster, then *really* pay attention to the review
you are getting, do not ask question to ignore the answers and stop
making people repeat themselves over and over.


