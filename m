Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A84D2F34B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7lOqExgMcdugcI9HIbQ5JeCIYCF/f+YAISpiToc7uE=; b=0nD10nx/U7Y3NykYASXmpwn1+e
	Lyc/lM21pXWZFXLVWrzFWeH/Jbt7l3HGRz6zkftfod/8GhcKGZ2GZHLay2l/4M5LGKg/OMyuQHwuf
	5/zLsVF6JJtx960/ZLeFfJhpImFMeaoD6u0f0dBSVT+KFGtQgYaGNcskrIrdCH075qvB5vnSH+GcX
	n73ZJxjQ5dKGaMu61uAj26L+dc17BOTbIr37XVtYNLX/AtFIwMNP7fODeloFNi4aWWtW2FkERI6TN
	5ZOco9DBACu9JIR1qLVOOEiEdTLxYc1xTEFcz31Le7MmpILHOUiTE+loIRdOf1Kt3xpYprKL7U5wX
	FDtnbkVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhrW-00000007Vcd-3Vn0;
	Tue, 13 Jan 2026 17:07:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhrU-00000007Vc0-2Mvc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:07:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0bb2f093aso53099855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 09:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768324039; x=1768928839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7lOqExgMcdugcI9HIbQ5JeCIYCF/f+YAISpiToc7uE=;
        b=R41sGJtwz6U6iGnp/RN4EaNt0lhsf26etRyABSh9rdFzqIf0OkxUPKzoCAvzGj9VVb
         dB6ueGz11MH1oc8O3ZTRM++6VS1MjfFyUh29SPILkislSZYymJwVhRmi3fr14tITKKax
         +4eVPFHAfyAxyaRM3J84bp+cqzoNQEa1LdvkU/BVBYu3IjeoHRumA1KObGdtvr51R+xD
         5o6/KxwsdjzmML/C+iUcRnAwWEgUu1uIWiYesCWDHsP3JoOIAwYGmISxi3i/OsYW3jA9
         ZcxgXndhmqiLXudnMdWW19vK6W378b9hn6dieBzPPrRHXxKLxrsSRmFkbzlMeyFg1bal
         REGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768324039; x=1768928839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7lOqExgMcdugcI9HIbQ5JeCIYCF/f+YAISpiToc7uE=;
        b=I6GSXlE5MKgp/Mw80yotgQXiALQKyfYo0kXRzD7PKoL2Z/OqiTRcAkjo3brgz5Y0Wz
         NW4gG2+FMxkXMq3p4/gF/TJbLZLinvBpgmxFfoBL8C2+t6sYgbfx3IlmP6guj959I4pp
         s71LHXIVsPsgcOfS2yCQgy5CtcOdyGYHRj+7kmVDBXL2KQkbfcAsQxL/KCE1MojpnM26
         q/lpVY+DbU03bxQmgASeqVyG8Dn/doXV9iV3e04DFE3ObPzKRf0F43SAdBrNWTqXn6jx
         WyfrL/yM+ZB0MxEK17zBgafGT61evSMpJNOIh+Nh5wRjkgtPvmRBRu8fsRHHLpwte3a5
         TvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSLToeNhccLbW8LgEFm9JdE87dyMXU/82JOml5PCxayQcu9OB+IdDk0WC05fp1443s6BCKuksYJAmIRv2nNIq7@lists.infradead.org
X-Gm-Message-State: AOJu0YyTPriMZ+aZdK1WtqOnuIxKUq6D7XvhtYucGeonssEgsh70Og/6
	elqempm5V7pLhn1bzGmIYDPo3UIkuAYWilyRnvg/CQ+UCxg/4H5wYBp6UEe2s/f9D14=
X-Gm-Gg: AY/fxX6xDGMoeAn+JHAHE6JXRKZ9t6mE8ey4C43qEajBjYEhmd6cABJ3TDz7han0TTn
	Z8ODDaZS2M2uY49kcMO0Y7Vm/s37nqYplIhvFwABdlXToz6VHxdePuxrYwLrw5p66biRpdJbu7q
	FMCoSsC/TOBrAClHFPYjkTdzvYn5UAsUSHBk4yXBh8be5Ewc8uBYYx3HQxnIYXwJQRLTwQOTsvt
	ZFeER2HcCAPEP3tCDYypolrbAygTHdXnxcrIoccbjqSufghYEgEkwllwfSL5WiSCxciHiyJc6E0
	5M3c19lFPE1Gw5CM84b6pjXnbmk7ulkylsi/xPnGY3S8wfW6ss0LtIXGo8I0fwOSykdBJDNTSPK
	c/Ja8xaW+rKhF+54h3vd5/TIiNQjOUIYQ+V32eWuhQsNEuwqnPv/EkXor3gtuXzHAD6QIPooVfz
	wKF7KYjwtFw1vppA==
X-Google-Smtp-Source: AGHT+IFOvPJP9R1hw4cpVp6os/r5K7GEms65q/AlzRFH4grW4yqI7xvevFuJtgCcEOr5tWpPHLh0Mg==
X-Received: by 2002:a17:902:ce92:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a3ee4aad5amr188877205ad.32.1768324039181;
        Tue, 13 Jan 2026 09:07:19 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:82f2:906c:a8da:1fdb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3632sm208565395ad.95.2026.01.13.09.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:07:18 -0800 (PST)
Date: Tue, 13 Jan 2026 10:07:15 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 0/6] remoteproc: imx_rproc: Support i.MX95
Message-ID: <aWZ7w5g7mYMDoffv@p14s>
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_090720_617180_A8C1CD4E 
X-CRM114-Status: GOOD (  32.62  )
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

On Fri, Jan 09, 2026 at 08:08:00PM +0800, Peng Fan (OSS) wrote:
> This patchset is pick up a previous patchset [1] with rebased on
> next-20251030, and some changes applied.
>  - Add runtime ops to separate cpu ops and lmm ops
>  - added more comments
>  - moved some check imx_sm_rproc_detect_mode() from imx_rproc_sm_prepare().
> 
> No changes to the dt-binding patch, so R-b/A-b are kept.
> More info could be found in commit message of each patch and below.
> 
> [1]https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com/
> 
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> There are three cases for M7:
> (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
> (2) M7 in a separate Logical Machine that Linux could control it using
>     LMM protocol
> (3) M7 runs in same Logical Machine as A55, so Linux could control it
>     using CPU protocol
> 
> In patch 3, Use LMM and CPU protocol to manage M7. More info could be
> found in the patch commit log
>     Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> 
> Patchset was tested with below boot images when the patchset based on next-20251030:
> imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
> imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)
> 
> Also tested i.MX8MP/8ULP-EVK.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v6:
> Added R-b from Frank for patch 4
> Following Mathieu's suggestions for patch 4
>  - Renamed IMX_RPROC_FLAGS_SM_LMM_AVAIL to IMX_RPROC_FLAGS_SM_LMM_CTRL
>  - Added comment in imx_rproc_sm_lmm_start and add comment for
>    imx_rproc_sm_lmm_check, and update comment to use "M7"
>  - Following the suggested code snippets, update imx_rproc_sm_lmm_prepare
>    and imx_rproc_sm_lmm_check
>  - With above done, separate the CPU API support into a separate patch,
>    no other changes.
> 
> Changes in v5:
> - Add R-b from Daniel for patch 4
> - Patch 4, per Mathieu's comments:
>   Move imx_rproc_ops_sm_lmm and imx_rproc_ops_sm_cpu to bottom of the file.
>   Set IMX_RPROC_FLAGS_SM_LMM_AVAIL when scmi_imx_lmm_operation(shutdown)
>   pass or m7 is started before Linux.
> - Link to v4: https://lore.kernel.org/r/20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com
> 
> Changes in V4:
> - Rebased to 6.19-rc1 to resolve conflicts.
> - Address Frank's comment patch 4 regarding "if (ret != 0)" -> "if (ret)"
> - Link to v3: https://lore.kernel.org/linux-remoteproc/20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com/#t
> 
> Changes in v3:
> - Add R-b for patch 2,3,5
> - Patch 4:
>   Rename imx_rproc_ops_sm to imx_rproc_ops_sm_lmm.
>   Add more comments in code
>   Simplify if check in imx_rproc_sm_lmm_prepare()
>   Update commit log
>   Use dev_err for failure path
> - Link to v2: https://lore.kernel.org/linux-remoteproc/20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com/T/#t
> 
> Changes in v2:
> - Patch 2: Change to const pointer for ops, update commit log and add R-b from Frank
> - Patch 3: New patch, introduce prepare ops
> - Patch 4: Rename imx_rproc_sm_prepare to imx_rproc_sm_lmm_prepare
>            drop IMX_RPROC_FLAGS_SM_CPU_OP and IMX_RPROC_FLAGS_SM_LMM_OP
>            Add a bool for dcfg->lmid and info->lmid check.
>            Provide separate plat ops for lmm and cpu setup.
>            Move LM permission check to a separate function.
> - Patch 5: Drop macro IMX95_M7_CPUID and IMX95_M7_LMID
> - Link to v1: https://lore.kernel.org/r/20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com
> 
> ---
> Peng Fan (6):
>       dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>       remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
>       remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
>       remoteproc: imx_rproc: Add support for System Manager LMM API
>       remoteproc: imx_rproc: Add support for System Manager CPU API
>       remoteproc: imx_rproc: Add support for i.MX95
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
>  drivers/remoteproc/Kconfig                         |   2 +
>  drivers/remoteproc/imx_rproc.c                     | 249 +++++++++++++++++++--
>  drivers/remoteproc/imx_rproc.h                     |   4 +
>  4 files changed, 243 insertions(+), 13 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> change-id: 20260108-imx95-rproc-2026-1-8-04f759890742
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

