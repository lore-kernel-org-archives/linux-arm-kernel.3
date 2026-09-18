Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8763C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRW5+1Frva7zZ8isaTm2TY41CHJL0yWnE9pSGq+/CS8=; b=ieXzDKmZqCg+e18lWXBsXMPV3/
	18wvjqbK4zDL1yjr93a9EC6WZFLC40M8KbMMwxy8M4qFjn2Uqf/BPXdZ1hOop6oCfu8Lta2MjUXXF
	8pT3+ULYbAo8SVKSpXxeBNda8IjWKVeZIpLf59vz8QOU0myTsFIADMKWmEMVx7h6df9JTkppGnjxk
	pGiT3yvDspkAwXd7fmW9lsd1cRkUydLSn2lSI4yxaGDRZ6bLz7pzPq5XmMZCjAVfhVEyQx/In6n7B
	ibxonAk/18FEiIrbwfAycqah2rzS5O5zMhnnC0eo4jeh1W56mfdBf7B/AGrQOZJdN9zVqKxUp5npG
	MXQcbSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZTO-0000000Ehrt-0XjV;
	Fri, 18 Sep 2026 14:21:54 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZTK-0000000Ehqs-2Te6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:21:52 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485984ebf5cso622692f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789741308; x=1790346108; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HRW5+1Frva7zZ8isaTm2TY41CHJL0yWnE9pSGq+/CS8=;
        b=FWocIlcrjR4ZEx+VekwFER1arR2lKWBPiMFPiRgEDIILKqF0rGMd12yeERshaz5+ul
         J55wtCiPRzeZnEr4G2U9tPIJxbeUGvdQBs2T2IAVBwdrEcrhvaw/p9uIAoXV4NWhYFeV
         1ORDbALVNSccgUl7TgoktcyCJ9RUcFHnNPJjr1bJu5UYPm6b/gP42/vI9F8cyNW5t/a0
         RnF5ngfSTLm92fbpHZUv3Q8oeO1NQZ6wn308zlgDUf00Mbaj68uNLPiRlktqGRSiDh5m
         +hR/TWOjnoOwfK5/CLdhuKrkm5eKqKvN8zuvzitP0VV1Wgmxj7DKeKmipMxklXRXLSRW
         xdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741308; x=1790346108;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HRW5+1Frva7zZ8isaTm2TY41CHJL0yWnE9pSGq+/CS8=;
        b=q86YoKL3M2EimRYA2CCKmXdwvi3iMnTYAVNcDMoC3n9aQdm18ZlwaV6xUe0SWS+aQB
         mNGOWbcyAlGForrRdcOhCp038YTLVG9gdxGNTxq1tEw/oR7y6ACVxgSAW7yEbuzvrneZ
         Ws7J92FVdd+/LoImtw2UmXUZKSOC89GChIe2hzzqBO2b6KKSWINiCqBRSMfty2Ip+gy3
         K0FQrzO001l3CcRA0VWIMky5B5+nqgNul+rg3erY4x9ik4OeEPGvVLO4n8Vcx2p5sJ7S
         jIxbFsQ22m/5c9J1BzDXVODF7Beq4qasktyVkpCwH+IjoI93AO6DegZGKKZnfcJx2egO
         9Cow==
X-Gm-Message-State: AFuF++lEDKo+zszh66kIJcq0VZNrJXtrUBl8JM/guZRQccMr3JwDp/jb
	gzbjQu1P70/4DjBf+cOUvn2JVMyp8SMv9QNf/p7JFtZF8QjQW5301jjp6qahkhfUR+o=
X-Gm-Gg: AYBFou1nM/17GnO2KedRzy6P2UaK/4yIeKmR5bO8hWXEYjeo/Fh26vySvXsWI9KI7NJ
	IuRC7ZyuC6TCfNjx3C6Fdk/OtsMGY8vqt6jTSAxcRD2GWmy4muNyLaGLVRxYc2i6ocLuSs1hqhb
	w9tQ3UzlepRrKBI+n0x+YxRcRZacmTluVUnkrUCslzZIUKzDhlmckxgwIc+43uIhuMkbvJPrJ02
	GswfwoYWh8i/Hn4V9x4DyTitAwGFFsqhmxBil4KxHebpHVmB4UpT/tKx+rcF2cgebst/Zg85gQK
	GZ3CF8eLu3O6K3p72rkeULtE8VTkwmPpR+0MoJF87WuQb3VZ6IT6x91Mdwa52+dRx6NPRu++OA5
	64QdaneImIhrrf1OrSfrIgdfBYUvVmauxunOXL4VnFkUVD4+3puTVFSMmvPDVZh0ZdZPu4WHKa+
	Ne1XRUMFFmxJG4EcwS9uqrzatxfnwXNYZbwr8/TbAKirmiWcSkYZE5gdVIAigGvaeDdTbQsDirI
	ij3PUC83nKj+aY=
X-Received: by 2002:a05:6000:2904:b0:487:197a:e27c with SMTP id ffacd0b85a97d-4871e244c22mr3729361f8f.8.1789741307974;
        Fri, 18 Sep 2026 07:21:47 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5de3sm4774627f8f.1.2026.09.18.07.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:21:47 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,
  qinjian@cqplus1.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  linux@armlinux.org.uk
Subject: Re: [PATCH 3/4] arm: dts: sunplus: add Tibbo LTPP3G2 board
In-Reply-To: <20260918-silent-zircon-cuttlefish-bafcbc@quoll> (Krzysztof
	Kozlowski's message of "Fri, 18 Sep 2026 13:31:00 +0200")
References: <20260917082632.626614-1-ag@ffroot.co.za>
	<20260917082632.626614-4-ag@ffroot.co.za>
	<20260918-silent-zircon-cuttlefish-bafcbc@quoll>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Fri, 18 Sep 2026 16:21:43 +0200
Message-ID: <sa6bj9ufxmw.fsf@dev-ag>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_072150_939919_7AB147F8 
X-CRM114-Status: GOOD (  12.34  )
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On Thu, Sep 17, 2026 at 10:26:31AM +0200, Andrew Gaylard wrote:
>> +		bootargs = "console=ttySUP0,115200 earlycon root=/dev/mmcblk0p8 rootwait";
>
> None of above should be here. earlycon is for debugging. Console is
> below. root - why booting is fixed to mmc? Why none of other boot
> methods are suitable or allowed?

Because as of linux-next 20260915, ethernet does not work (crashes the
chip hard; I have a patch series coming that will fix this), and the SD
and USB drivers are not yet upstream.  That leaves only the eMMC for a
rootfs.

Nonetheless, you're right, none of this belongs in the DTS.
I'll remove the whole line.

>> +	pins_bt_reset: pinmux_bt_reset-pins {
>
> Please follow DTS coding style for naming.

Will do.

-- 
Andrew

