Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A935C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=; b=2qcpq3PJDYIAEx14Tby2Cy05A/
	YZrez8lP6vPK/8QPORFRToQw//2kAHRpe3fJagdnW7BRysOLoeS495BCcwOCx4a/DiwDTC/JSTYAv
	CRXVudEYMIqU5/Nj9Qfc87ob6hWJm/FUOA0Ldr75XX32cdM2Fn/uMPqEYcIxtI3hEzezFuGmdm0iu
	EQddxXNw/agmnKHmv+ZkKywIqXCHUtURnOGEJb4bTkF2lYO1ReiN4NmS/gmvefFDYxXypjHhyK9FA
	PO1s+3iDjl0qSqG4O8Q4v1NsdGv0f9mDuQu+libAR5ljvFW+gHHWcntMhfBOLTyXGbYHmy+fteEcY
	vpAwiKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P7z-00000000jPJ-0UIm;
	Fri, 25 Apr 2025 19:54:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P1t-00000000i4W-1mne
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:48:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso1714920f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745610487; x=1746215287; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=;
        b=dceKLTyYsPyxuwoKJszJgasTKuqMtCPEL171pAx++vAlvYooaGgrs47ojBKoXMmLm9
         TSSAqMmXglbCzwpoj6FdFk3tleuI72GFKVfLx07jpQ7UfB+8YUgP7zEOO63Bn3zrjZXT
         1732YdYdq/uwjRAaHaavXJs4oj/+W1BAQSuad/VltYABP/i7fBgL7cL0bYO15cw5Eda/
         dwotIMNgR5jQpf/ctR5nhNh0GsSxeh+A5udiiAWgpl99Kp7nGvpyxk2P3C2nInUamaX3
         jyWJIm3U8frWxNsGVMgSf2lfcT0UddfEm0Y/JQZmtnYev2kMDZqY4HcGH1NpN4umkKXL
         vCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610487; x=1746215287;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=;
        b=CVmGSGRDWIiOgh1hIj/O7SXBu5sl73PIiiC51WCPH9TYxtaqZVzh6Iuttc2sruiBdT
         Lp1qXmgHeNKeKJvm+5OfnHWzH8NVVuqBwGV7zkxK/JcPOT/0Kle3scKfSFJXTLYyQX3Z
         Rp++2/dsGiTT/XtF9HPbv1cHTul0zCC5s2z42KUqGRbcI45K1FuFt09TM27xMcr9QnE/
         BAIcmOmPni1TRvn551+9XTH8VdmKKDJcl6P8KTkpuIUL07drdapf8GUmtalNlmkxT6Cc
         2BlpYELo7/SeM0roSAFYCpDudYJHKnwkEeOWtIYhcQfM1VF3l43YO7iLQEXTHvkg3XUL
         ImMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN3bKlUhj+tkH3IR0cq2RFmMpf1JVzxTQWE9n++GZxWE9vTN0qw3ih2Sb+9LkDdCC4EZPFtM3YcA09dmngjJos@lists.infradead.org
X-Gm-Message-State: AOJu0YzWIIPBsRz85SftQ70rCKu1VJUstvbaxffwkbHEA2TU5XMucdX7
	Y8Ww0WF+yEdOfKFRRqrJClgKZrBDhWgAuz/v6NsVDSPz4PXSetfjTCSNyxak2Kw=
X-Gm-Gg: ASbGnct7MIgINKvrgsqMvvAHJ10YaX5MrXUxU+fTRAoCtBhya2JnYBcD2ewEEZn1hUm
	AP4vOL8fcamAmJ2B7ptzmCDeP9BEwF3E4WWXY3GllgGfmj++QC4eL/yMsbVA7xR0KF6PA1f8gEF
	CEvl1okgQdBEQZjQ+8FQxee1nApVzbw8Ti5tbjUNeyNfyTuwC66l0QzYjF0FccbA/4OA0gxF3zu
	ShGsBCXMISrDe0MfX+D2pA1TEBe/gEFvBfI5l3JruZY39spCSIA+On5b6yYK796ObNrIYA18/IT
	wkvaRnLjNUE/QB8sIKsm8ymOqqMOl2ISMrJ2NtxEQ30rA0yHMtqgvzvHEk5IANiUKtlN2oet5eb
	N9QExDqoiuqGlvWEPT9DPVa8FPXEW8zi6ScdVqWKylaXa6Glj3F4IMfDcX2XVPJQ=
X-Google-Smtp-Source: AGHT+IHfsn5wCKhwTa0J8zfuwB8lcJPWgRUEQdZlhyrj1mUqnBM8NKHg90Ct03YfbCjHwLs/15BqRw==
X-Received: by 2002:adf:e5c3:0:b0:39a:c467:a095 with SMTP id ffacd0b85a97d-3a07aa7545emr335807f8f.24.1745610486979;
        Fri, 25 Apr 2025 12:48:06 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8154sm66076505e9.30.2025.04.25.12.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:48:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 21:48:04 +0200
Message-Id: <D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <peter.wang@mediatek.com>,
 <quic_rampraka@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_124809_564264_A4EFD37B 
X-CRM114-Status: GOOD (  10.97  )
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

Hi Ziqi,

On Thu Feb 13, 2025 at 9:00 AM CET, Ziqi Chen wrote:
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequenci=
es
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.

I believe this series is causing issues on SM6350:

[    0.859449] ufshcd-qcom 1d84000.ufshc: ufs_qcom_freq_to_gear_speed: Unsu=
pported clock freq : 200000000
[    0.886668] ufshcd-qcom 1d84000.ufshc: UNIPRO clk freq 200 MHz not suppo=
rted
[    0.903791] devfreq 1d84000.ufshc: dvfs failed with (-22) error

That's with this patch, I actually haven't tried without on v6.15-rc3
https://lore.kernel.org/all/20250314-sm6350-ufs-things-v1-2-3600362cc52c@fa=
irphone.com/

I believe the issue appears because core clk and unipro clk rates don't
match on this platform, so this 200 MHz for GCC_UFS_PHY_AXI_CLK is not a
valid unipro clock rate, but for GCC_UFS_PHY_UNIPRO_CORE_CLK it's
specified to 150 MHz in the opp table.

Regards
Luca

>
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> SM8750 MTP + UFS4.0

