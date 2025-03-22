Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD7BC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 07:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayMGlcqMwQb+ftuOYdEgfcPSnBDR+02p6diqdiWcO6c=; b=jYR9D6iqj4SpETBQriXsFLpQ0N
	uANAYekWUu5wfc+FB7FiM//O/8Dkpk+XvIMYrCWC0D4uu3UWj90Kw3ams4is9/+bla7Ikm5Ta0ryh
	GfxggP6sdDMKBE6vnvVDCdshYRFZ+rr7iOZRTa7DnPDi+25InJIkb8PAlp4bEr63Hpm3Numsi8YBc
	zOVwgKChLBQjLnFDXXk6sUNhSv4E2RbomzCHSeb4NMCZGZqXSD6HfJ9vl6iBJJ6RfizekEaTErH8g
	N6bCGNeqklvzQ6z+OQgBtq2frD9gB0g6AzGS4ovWsLRCpLw9nZ/COcEGAKq/ViWGstsgAHGZFohvf
	Is5RQqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvtT3-0000000H2QZ-0Wzn;
	Sat, 22 Mar 2025 07:40:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvtRM-0000000H2D1-0yfo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 07:38:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso19968015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Mar 2025 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742629122; x=1743233922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayMGlcqMwQb+ftuOYdEgfcPSnBDR+02p6diqdiWcO6c=;
        b=RNVLHQ3wxYXzEuQ5KXYZ/Q8mYIakaWdgTkaw3sze2A+wwAvQVpqWKO1zsMCa9bSIpN
         gd9guHmnrU58kmT741CQZJ8suM6CyFIh+20vYTcOSyOd/pkxZKDZMU+FBUGE7054EwDF
         b4Lr48tW7ycdaVwNGGRGRXUd69DNB+AZPHdSN6gFiNcmiThYngd9DupsTunl3RnJmgbz
         sSVBn/ycTNze1FUQULtnSCmd5opTm96gIwC7onvMv0f24k/neyWkqcngEVmCg+5YAmzS
         gHR4Wgf7/lAhpfYTrMBYGJtEflI+m5NvAMaARXBrhFPBYRpABwKhI5F/8D2lHE7mUccL
         IGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742629122; x=1743233922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayMGlcqMwQb+ftuOYdEgfcPSnBDR+02p6diqdiWcO6c=;
        b=dgrTNzQjcY8IZ8kUj4Vob4fW8xvtAYrRk5fMrzVre5xRgVEQrNZVtphq/85XJ8tqKe
         5/gSqjXW92ZAcmTZwieIaAB6LMrNk3Fbz7wrQrxNxLgK5/dQMXAqtuD6ql/AqW3hsmCy
         jHMZY9k8GLIw1k41mz/X0mfJEerZ4+7OMG4ugHDWQY4L3zk0tkBPwBttqrgU98xCrtu6
         2RL1oTJcGkYF6Q5ML3gNKJAkI3X1xm90jLxlQ3ORuIwb3m+6USAqpdvyjzKFdVLStcef
         2q08Zdb61Bl2/BaMjfYNoOV3PA3y5to0IhAkXa/+16rJgIlryggF0Oua9x9RLIBkT4RY
         vFyA==
X-Forwarded-Encrypted: i=1; AJvYcCVL/BPz+nTQL/8lMFta43VkhLLoY3BuSq67stUjJtC7IOJEC9YnqoBvKl7wTB/naMZWlrN/pGmIXpmBNeV2rzrQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzvWuqMVpEQDKlsLu65h3ABPcKh4KWID8KnrMGMi+IhJw7LiNos
	boKxrNqOhQE4kObrZeZkQ+QOQRl2W8drSVMsVG9vUin5BjC/4SOv
X-Gm-Gg: ASbGnct4xkXFxNRf0CIXhVY2hNbF4imlGb5MF/94lYw3haoMq/ald5EfpPWUQ6pNy0z
	fho7s/tUc43HTry1DrQSMbO8wu8Cjbs3oaL3GLwU5PqLjsUyH3q75PftMaxLLB1XD9+fMJ6icyW
	8HQW2/TLyNKAQlInRdQ33JHZXxISyeOzgd9bRAmQavW6J55FzBGVje0ru8JbVo+G4x6z7F/MsFm
	bL9wj6UX+E1SRAgiLsxaAVnzv094AJhO/Vdmm9Z6ETs3k9xSkj10Hw27BApQ8U5f5+pFha2+gE5
	p3c4QzDB3PPSfyPolAd0C7M9tMQaLCe2JSVD2Soy8GIowHSP+Pf8WaNJgHvjtMDaH2awqNbFZJp
	rJifbXwMI/YiOmxUQI0ZS
X-Google-Smtp-Source: AGHT+IGOAdcCQV9td5yBg/DeGMyuPfW6QJ09F7Nlor08PYOx21zTuurCfS0tdlMSsD+iLtwPsmEq7w==
X-Received: by 2002:a05:600c:1909:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-43d50a213f6mr57806325e9.22.1742629121821;
        Sat, 22 Mar 2025 00:38:41 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eef37sm4347075f8f.85.2025.03.22.00.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 00:38:41 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: sun50i: prevent out-of-bounds access
Date: Sat, 22 Mar 2025 08:38:39 +0100
Message-ID: <2772067.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250320155557.211211-1-andre.przywara@arm.com>
References: <20250320155557.211211-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_003844_304293_4043947A 
X-CRM114-Status: GOOD (  13.63  )
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

Dne =C4=8Detrtek, 20. marec 2025 ob 16:55:57 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> A KASAN enabled kernel reports an out-of-bounds access when handling the
> nvmem cell in the sun50i cpufreq driver:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-out-of-bounds in sun50i_cpufreq_nvmem_probe+0x180/0x3d4
> Read of size 4 at addr ffff000006bf31e0 by task kworker/u16:1/38
>=20
> This is because the DT specifies the nvmem cell as covering only two
> bytes, but we use a u32 pointer to read the value. DTs for other SoCs
> indeed specify 4 bytes, so we cannot just shorten the variable to a u16.
>=20
> Fortunately nvmem_cell_read() allows to return the length of the nvmem
> cell, in bytes, so we can use that information to only access the valid
> portion of the data.
> To cover multiple cell sizes, use memcpy() to copy the information into a
> zeroed u32 buffer, then also make sure we always read the data in little
> endian fashion, as this is how the data is stored in the SID efuses.
>=20
> Fixes: 6cc4bcceff9a ("cpufreq: sun50i: Refactor speed bin decoding")
> Reported-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Thanks for fixing that!

Reviewed-by: Jernej =C5=A0krabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



