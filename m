Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A83C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hAheUb7/AxYlrzvi7p9cQwyJGov/uzXYHxHoxFstwc=; b=iF+Iwrdp1fXnnhI05feDxCrbSg
	93cQMlBJLMUTogcvlzuUi/dicAG9fUl9haB2LDF4t3EUuhmdw9D/7wfEKud40RRSggFvCKbnJ1mgU
	jXGBKlr7Svj5KV4ivStRDatZJBN4OsDU/VK+PrIJNlnuJHvMUHFXL58uJwbNvWmqQ51ohmIYUcxR0
	XS4coyXtuda8JO+bxrwV/24XWpzcKu5xOaI/i2eXBDRjtBujenJwZRJAETrMxZ2CFEov+hkx/6XTq
	UY6Wuaj5owyCKxespVphyy54VBL37UE9zLBgyanxv68jHe3HbgVCYMYjFk1s/OZgR/nKS0I8n3MO1
	K1eWMzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I9t-000000087u7-3UkS;
	Tue, 22 Apr 2025 18:15:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G1b-00000007oqh-2PAD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:59:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c1efc457bso3360675f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745337546; x=1745942346; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hAheUb7/AxYlrzvi7p9cQwyJGov/uzXYHxHoxFstwc=;
        b=LaChwyIQuTgAYrAzZWBLmsglsk/z9nJIqiI7xGEgv1I2Y3cw6tYJZBFEbwnOxxwDMB
         dvWgmdK0x9FbPWx37sRei6D0XRoiYAl9y1W9az8zOfsu/6tmXUvV1MFwiK98EQcIYDeS
         S9RCBgW7bT8jk7PHhHlI7LbbkINBv/t9crKF60y6vHsoECoT6JM21GWcxRbk/6LnlvEF
         jyqQDqVNLua326O+G9kpg26ZPJu5N1sb+C+154XXyCkBUoBGmW04F23ibfSlv+aXqbCj
         Fifq0z+0Efhqm47B/vo3uuyRw3VOm6Wo1ztC0O59AmP5iHLDQQjjkBWLAovYshudQnnX
         Tjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337546; x=1745942346;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1hAheUb7/AxYlrzvi7p9cQwyJGov/uzXYHxHoxFstwc=;
        b=b+MMKhe5OwKtY7MHThdQitBBA0GjlFBTTRPULmhJhUNRzQLj6N0n5ZxEnG7r5XEeia
         9GKlGxPA3tXmHws7UyHuEDYiIj0zS7beCCG7W1JIBC8ngSOD8zoq7skeqe1zLE5mKaNy
         zaXi9ohpoW4v6IKMP7eCn9iT5qGRXJs5wtQnbAOSs9MBcGKm6Z0u7D09i95hLyXrEPj3
         tKz1ri7vGxVx56PxysMvCco3Pd4URfjXwG41BSXehHNEU05n8DWQYX/hmTBTdEhXnyFZ
         niHFDp5dQ6+pTuTfU/d2Mry4kV57GrAyGAjZL7FU7SDYcv2ln0rWsG/E+V1Ua1vgRuqQ
         8f1A==
X-Forwarded-Encrypted: i=1; AJvYcCVKK6wdA7pMvM14OpCmjkWUGLLFOcicY0drGkSwMV6gPzVZSAcWB0SS/5dBIs0CmzBwbFCo6wVkGv3BBKRQ3xVr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/97ehVL8OCR+PGUdVQuIF79wlN30TyYnisOzG2Mac9odSF03E
	s9K010kaFc4nqCXEAMVWtSdnt5/xI7r+mHRrPQzArRRj1eaSmsBNzPR463XDJcg=
X-Gm-Gg: ASbGnctUULCZI7cJ7ShQRYdM+QJ4bBBaY1xITDA5bLvZIeih70U3wJz7riTxEWYIyYK
	8ozk3iw4EGxSxowHfdx4c3RvrOxcqITzpOoNR6CkKMLZjqDq84b/EtAwZ9D2jDDn94vNYHRIdBK
	hvS1zUsSejeojNFip4GDAPT7CmYlAqo7JbDomVcS7c4mpppaw7mJINhfBrf3QNsJ+i9JRGwMIRX
	MZm8xyXzgik3PRVToyuZszNxxE6Kbvrm6+Nb1aBWVvnjTYfNwnWozMM2f+IR0srV8JmUbmz0LQz
	hAangyfmGFO/xXSUI93pm8vVj+TSm9tKm2t0+yT8+7HsRQ==
X-Google-Smtp-Source: AGHT+IFeH0S2vE5n+XA/l4vfJhnhOuJ0R4qy6RCQGw7qpnpnlen7t2GaUFL3M60QTyETclUPXi4vdg==
X-Received: by 2002:a5d:6d87:0:b0:39c:1257:c96e with SMTP id ffacd0b85a97d-39efbb02224mr11882093f8f.58.1745337545702;
        Tue, 22 Apr 2025 08:59:05 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d74a1sm176570345e9.37.2025.04.22.08.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 08:59:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Apr 2025 16:59:04 +0100
Message-Id: <D9DAIUZXIWH3.1L7CV6GEX4C9M@linaro.org>
Cc: "Fugang Duan" <fugang.duan@cixtech.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "frank.min@amd.com" <frank.min@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "david.belanger@amd.com"
 <david.belanger@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "Peter Chen" <peter.chen@cixtech.com>,
 "cix-kernel-upstream" <cix-kernel-upstream@cixtech.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: =?utf-8?q?Re:_=E5=9B=9E=E5=A4=8D:_[REGRESSION]_amdgpu:_async_system_error?= =?utf-8?q?_exception_from_hdp=5Fv5=5F0=5Fflush=5Fhdp()?=
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Alex Deucher" <alexdeucher@gmail.com>
X-Mailer: aerc 0.20.0
References: <D97FB92117J2.PXTNFKCIRWAS@linaro.org>
 <SI2PR06MB5041FB15F8DBB44916FB6430F1BD2@SI2PR06MB5041.apcprd06.prod.outlook.com> <D980Y4WDV662.L4S7QAU72GN2@linaro.org> <CADnq5_NT0syV8wB=MZZRDONsTNSYwNXhGhNg9LOFmn=MJP7d9Q@mail.gmail.com> <SI2PR06MB504138A5BEA1E1B3772E8527F1BC2@SI2PR06MB5041.apcprd06.prod.outlook.com> <CADnq5_M=YiMVvMpGaFhn2T3jRWGY2FrsUwCVPG6HupmTzZCYug@mail.gmail.com> <D9CT4HS7F067.J0GJHAGHI9G9@linaro.org> <CADnq5_ML25QA7xD+bLqNprO3zzTxJYLkiVw-KmeP-N6TqNHRYA@mail.gmail.com>
In-Reply-To: <CADnq5_ML25QA7xD+bLqNprO3zzTxJYLkiVw-KmeP-N6TqNHRYA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_085907_620633_1A55A3DA 
X-CRM114-Status: GOOD (  22.41  )
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

On Tue Apr 22, 2025 at 2:00 PM BST, Alex Deucher wrote:
> On Mon, Apr 21, 2025 at 10:21=E2=80=AFPM Alexey Klimov <alexey.klimov@lin=
aro.org> wrote:
>>
>> On Thu Apr 17, 2025 at 2:08 PM BST, Alex Deucher wrote:
>> > On Wed, Apr 16, 2025 at 8:43=E2=80=AFPM Fugang Duan <fugang.duan@cixte=
ch.com> wrote:
>> >>
>> >> =E5=8F=91=E4=BB=B6=E4=BA=BA: Alex Deucher <alexdeucher@gmail.com> =E5=
=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B44=E6=9C=8816=E6=97=A5 22:49
>> >> >=E6=94=B6=E4=BB=B6=E4=BA=BA: Alexey Klimov <alexey.klimov@linaro.org=
>
>> >> >On Wed, Apr 16, 2025 at 9:48=E2=80=AFAM Alexey Klimov <alexey.klimov=
@linaro.org> wrote:
>> >> >>
>> >> >> On Wed Apr 16, 2025 at 4:12 AM BST, Fugang Duan wrote:
>> >> >> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Alexey Klimov <alexey.klimov@linaro=
.org> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B44=E6=9C=8816
>> >> >=E6=97=A5 2:28
>> >> >> >>#regzbot introduced: v6.12..v6.13
>> >> >> >>The only change related to hdp_v5_0_flush_hdp() was
>> >> >> >>cf424020e040 drm/amdgpu/hdp5.0: do a posting read when flushing =
HDP
>> >> >> >>
>> >> >> >>Reverting that commit ^^ did help and resolved that problem. Bef=
ore

[..]

>> > OK.  that patch won't change anything then.  Can you try this patch in=
stead?
>>
>> Config I am using is basically defconfig wrt memory parameters, yeah, i =
use 4k.
>>
>> So I tested that patch, thank you, and some other different configuratio=
ns --
>> nothing helped. Exactly the same behaviour with the same backtrace.
>
> Did you test the first (4k check) or the second (don't remap on ARM) patc=
h?

The second one. I think you mentioned that first one won't help for 4k page=
s.


>> So it seems that it is firmware problem after all?
>
> There is no GPU firmware involved in this operation.  It's just a
> posted write.  E.g., we write to a register to flush the HDP write
> queue and then read the register back to make sure the write posted.
> If the second patch didn't help, then perhaps there is some issue with
> MMIO access on your platform?

I didn't mean GPU firmware at all. I only had uefi/EL3 firmwares in mind.

Completely out of the blue, based on nothing, do you think that
adding delay/some mem barrier between write and read might help?
I wonder if host data path code should be executed during common desktop
usage as a common user then why it doesn't break later. But yeah, I also
think this is this motherboard problem. Thank you.

Thanks,
Alexey


