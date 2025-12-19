Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E56D74961
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHPtjrQR6BGiqK2vk4UpNJZFJRTk/Dln70vYvB9yRis=; b=4Bd/3zAPSj4H7pSBjmOhdbtQHy
	w3XrfYfVHj9h0qvhaIQSqV2cvtLMzxRuFIHqOX2qKEiQ+yxI/EhWPt7sj/4Ji3sLQ/Pf/2CF4NnOa
	ntz/GHTsQU5ZvdMxnieg+YYClG3vZlW88Zkto/xFJjWlnlVWogrnbp2Rr4h/+N1pqgx4x1kP3TJ2W
	z+B1ToecMUoRtOG8ItIp1BK5UqsjQwO6olrarA44osAxY/seAksxzabxoZXo539KJRDgtnnFRFFeS
	ZUDZ1bLMWClA+k1j0mfjK52my13Sha6JkINt46opJYRvjJhIiT0OzucErWpDEQF9F+wwzPhdw1fAa
	U7qc6GHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWW16-00000009scx-18KM;
	Fri, 19 Dec 2025 08:39:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWW13-00000009scU-34Tw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:39:15 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso1364636b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 00:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766133553; x=1766738353; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHPtjrQR6BGiqK2vk4UpNJZFJRTk/Dln70vYvB9yRis=;
        b=NfvZzLmrrSmvrcXuAZRDk6DkD8wqHdN3BQiYAccd5ZrQE/I6xjCFDNXLOVve9flA7U
         KcmGL+xddh5Dz4JT2ieqlJKoQKrMzqwfYuDLDGDSKsooHikK4Fv0lvn7PqIiL3anmTeK
         K9jrbKATinpXxbAXirxSyAMC57xDw7GE9iRPMgPPeljagHXLebE+pvBgy6If9ck47PGn
         s7uXEkRINv4Rd8OSZ40Yi2yot4KYZnnt4zkqLMSNx1eMEnDHcfCyrtItLrPlygg78rsr
         xVQNAHskt5zQ53uJrOmnvMGoyIQz9Fh3FL07cI31fTMTaN1tFc/qTjCa/Mdt8n8XhqEz
         ZPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766133553; x=1766738353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XHPtjrQR6BGiqK2vk4UpNJZFJRTk/Dln70vYvB9yRis=;
        b=L1HdFQhj7J3OCXDqSld42PRJjkybT6NWeqQVGxIQKcC1XUOjEwtEjCi3pPgV4e8xBW
         vtGTwXMMeAFT/J5kdrG4ThYDF/mzl8LxHOO5FIX9sxv1aec0JBWbufG5spNPMry0LW0L
         978SEfnrlqNAVAEL1p77KFknijn/6jfpsJ/tjBb1A8IFCHtOAojQU6ExFvZkPjnC0XvR
         Itxvn8uXjZh7z1CX4sRmHfJjOa6q2afdcwbQWaq8d/q+0rYzqhcLalevSVGaexjPKU8l
         lV8faLY8HkzLlMpYiR0mvyMXXo7qHXu3dDF+XBFfDQ8hhV5LyKK9erEBE4db/EtJ09Qy
         oguQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi5QHKz6xCm1zXe9gZD6cmOqRAXWouZi9WGd50JgRZUurRc42eVQUnjF0KIGCWV8x7H80Xbic+KJsk0WA6pyWF@lists.infradead.org
X-Gm-Message-State: AOJu0YwaJ340OgKEoJanlxxgPwt80HmTV5vMmmtE+Hal2gGPyf5nI9jE
	AHlF1cCdblTYPnvD88Rqdl1RWGhNTLbGkFEwFNWIf3FHcbjAluFpoYg3DNresJ2Pt3kwBWvFGlR
	o0NbO+pv6UfWp8bfGFxOcHJIYr5VRpyY=
X-Gm-Gg: AY/fxX6NDLK5wX4mTUcYiMGRXrk6FJOtp/JRWaUo1Y1Yn/R8i8qNBjjiZNabROwGONC
	zk+SgiX0WJwWZ/7feuakWcfc6VBJZQspF8yVQf8Wijfdr4lbhrhZ5+yJ51UuOmjP2yEFM+rmRcr
	tFyJo6D4DtETuIuTcWTohgsG8hx/vem+RzD/I2uQQjiSDLFtZMfhmeypPsPueRYrEPoeqPw7MYJ
	zK4N4xZpLEmgGNdF3NWQUCZNyiHvmOHjrPlzQthbwIdYzOuZ/gPZFnFxhB+PWjFMGdC/+m2
X-Google-Smtp-Source: AGHT+IHqgr7jlDCQgsez8DnA9gOiflIl3Y0LMQ32Pm5ymOJkvX/BBOkn43OWK6VsRVbXsqbrmwwyxgH3uCLfvEaBQjo=
X-Received: by 2002:a05:6a20:918d:b0:366:14b0:4b07 with SMTP id
 adf61e73a8af0-376aa6fa3e9mr2147150637.67.1766133552891; Fri, 19 Dec 2025
 00:39:12 -0800 (PST)
MIME-Version: 1.0
References: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com> <c56ef6e76858c7df19ec43a3a18ccf79ff3cc489.camel@codeconstruct.com.au>
In-Reply-To: <c56ef6e76858c7df19ec43a3a18ccf79ff3cc489.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 19 Dec 2025 16:39:02 +0800
X-Gm-Features: AQt7F2rY9aYq6gs0_U_Uis5_kQpmhb9hiFjrZkiRiPmJac1NTUb6QoRPAfrV0sM
Message-ID: <CABh9gBcntYi6WeL6bOAAboUdic8afmn4X3-LW=zaHDditTr9OQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Revise Meta Yosemite5 devicetree
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_003913_774629_83471E97 
X-CRM114-Status: GOOD (  13.84  )
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

Hi Andrew,

Sorry for the late reply. I=E2=80=99ve addressed the points raised in your =
review
and sent a follow up v3 patch series. Thanks.

BR,
Kevin

On Mon, Nov 24, 2025 at 12:53=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> On Thu, 2025-11-20 at 13:25 +0800, Kevin Tung wrote:
> > Summary:
> > Revise linux device tree entry related to Meta (Facebook) Yosemite5.
> >
> > Changes in v2:
> > - Add ipmb node for OCP debug card
> > - Link to v1: https://lore.kernel.org/r/20251118-yv5_revise_dts-v1-0-fc=
d6b44b4497@gmail.com
> >
> > Changes in v1:
> > - Increase i2c4/i2c12 bus speed to 400 kHz
> > - Update sensor configuration
> > - Rename sgpio P0_I3C_APML_ALERT_L
>
> Sorry, I replied with comments on v1 before I saw v2.
>
> Can you please resolve the discussions on v1 and send a follow-up
> series if necessary?
>
> Andrew

