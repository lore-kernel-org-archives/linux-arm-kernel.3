Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C7FCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 00:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZSFox7DYtsZr6D8rsT6OanL7ONG4L1d4OFVS1wYXN4=; b=xZTJk+ttfa8HgDBd43cU26Vzt2
	GfLkjPXONYDHCxETF7hOxgzzd225SnBLwRBu/c4R8hK1cuI14vqsk3Y46RmKbanyYA3AO6KNDoG06
	2mVKSzvU9B3hv8MUfk+S1CwIRGCcPQNTN5dWyzA4nPB95Wvj3GHq3PKDugN5/L2v2lorLPTVWbDcQ
	jquy5bxoTYafcBSGFAtwiUO71uec6nhs7oPCIw4pnV2bebMy0BxM6deJ68Ql6qOqGG5qCmW17pbDB
	163BMt6XDdZUpFaBfK1YLGIag1x0Mr7Tf3xj+ca3fsd1L1oZejWrP0uPeY7z1Txczmt7WseXdV9Ua
	LW2o2jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhAA-00000008ZLo-1Eh8;
	Sun, 11 Oct 2026 00:11:38 +0000
Received: from mail-qk2-x0b.google.com ([2607:f8b0:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhA4-00000008ZKe-3aQl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 00:11:36 +0000
Received: by mail-qk2-x0b.google.com with SMTP id d75a77b69052e-53503aceef0so5253331cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791677491; x=1792282291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZSFox7DYtsZr6D8rsT6OanL7ONG4L1d4OFVS1wYXN4=;
        b=FPeVnrFBYsOUHKsYrvsxPSZf+E8BFXmfJicqrV8hC+uqCYzayEaYoVIjDsCTWd6/nO
         X6gt/w7OXbrsiAWBZ729hEe3jXM/cnyQmrGgYQ33UsWdS76SzMDhYpl2/k4dvpYncURQ
         kmpJGhxeCRQikss20tQs/5y+6Fs/ZrIl0Weg+ofRXlcxokS/gnPNsvBYaikYtwzMgnms
         pGoS6aEnQ5MpqMcPIIOjwkPuzMf8EXvsJQBEMnFMHr4KrZtxDiQBIB2L9qTSj71fBDF+
         152VePqxk0mAwN3X69lxa69MqdNrdQlyEvhU6G3/xrss09iTiN1fBgUGKBNn33HB0WSS
         9u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791677491; x=1792282291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZSFox7DYtsZr6D8rsT6OanL7ONG4L1d4OFVS1wYXN4=;
        b=kH6s5X3WQJsYf8jGjsQGjZK2zu2m6yRKtAG1bum8zEd+FA1Q0AQR53/p9B/EwTCWZG
         fz7ZXj+A3tcKcafpyTWND9jWZeATUKbMCp4K+isU0ATLSLX9p91GksyvULcvl7iaeNI8
         YfA/V9b4lJpqeAfHyBQpntmymQAO2/1+aZHjUWDz4XTtbGXQMET1biTAXlJ+lgPTs1ox
         DuWRlzsYCsT3g59oaAjGR/7YI9eICPCWCA5Tofqju6zpQxaQYc1ChqIOADEE0ogXj8EB
         waum3aObl610olv68KuLCTFgrDT6Iv0fMRJEUFYI/tWjPdc3dYNfszeMSqq/m8xULtkG
         gi4w==
X-Forwarded-Encrypted: i=1; AKwUvBzllIUb2oRokhvIMyJXku+6kssLwrBO4B6SIEzUzqwzeEKfk/jS5Lx/M7onWN+CIkfFJ3GovKygbctw7sd1Npag@lists.infradead.org
X-Gm-Message-State: AFq9FYLdG1bGVTu+iCZ4pNm13ZLpVDuzzdafWmr4eMvHebUzAoYNwNva
	wejvpK+8N9BH29MYw/cU+2MkOfUxSxQTNM0sw+kk4BNOQpgYOlwcosxs
X-Gm-Gg: AYBFou3XA68PZGDYhm3bdaJH29IHg2Rbgvj8qFe7dunx9BQEHIWhtcrfsXOD6zcj4ij
	U0iiM4accUkSpvsAflPP0M7rRVJCtwCNmFHWVbpYx9cpk4/bQpZ+VR0i4gb+e0XvNmZ9+bIW/j8
	OzD5FzJioS5Ap1xi6aXTORY30r1q02r2TXPP9QS3Q+pyozqZTX/1tLdAg9O8XaTFxVZSDp7hVdH
	DNXP/wKM3lDRj87kHXH7ah4Ow+9eenmFbbRBbHVX7r4LdjPq3P38VRWg0RNxYVHtzDoS5gESDi2
	MIvXSCQXXoNXVIRiyCHqKxJ2god5YAUSJ/FzhPteE8jj0J3pIB6rxldhnWkM+vMbHPusEslpU/W
	rHFU5tCXuuauxSutfxTBsPswFYyCJjsnev/XAswgFlpzFKoj8f/o2Ws58v6Ag/0LkADeUIey7kU
	nLTWtW6xNvDD4+Pyhk6UAiewdo3ud+F6r2ZElKLMaspgstRrrn+Dhcj7/Ug88D8MCIoDyJ9cAOU
	MvWcQ==
X-Received: by 2002:ac8:5a4e:0:b0:535:341c:e2c with SMTP id d75a77b69052e-5359fb8f878mr101828041cf.39.1791677491408;
        Sat, 10 Oct 2026 17:11:31 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e7f6aesm57217596d6.2.2026.10.10.17.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:11:30 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: "irving . ch . lin" <irving-ch.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <mbrugger@suse.com>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Qiqi Wang <qiqi.wang@mediatek.com>,
	sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH 3/3] pmdomain: mediatek: Add power domain driver for MT8189 SoC
Date: Sat, 10 Oct 2026 20:11:23 -0400
Message-ID: <20261011001123.1092269-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260202064820.347550-4-irving-ch.lin@mediatek.com>
References: <20260202064820.347550-4-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_171135_758829_12929322 
X-CRM114-Status: GOOD (  14.50  )
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

Hi Irving,

Some findings from running this driver on an MT8189 Chromebook (Lenovo
IdeaPad Slim 3 Chromebook, board "quigon"), mostly around system
suspend (s2idle through the SPM), on next-20261008.

1. MFG1's EMI GALS sleep-protect step, BUS_PROT_WR_IGN(SMI,
   MT8189_PROT_EN_EMICFG_GALS_SLP_MFG1, ...), targets the EMI config
   block (emicfg_ao_mem at 0x10270000; SET/CLR/RDY at 0x84/0x88/0x8c),
   so on MT8189 the "SMI" regmap has to be that block. Without a
   mediatek,smi phandle in the DT, the step went to the wrong regmap and
   wrote INFRACFG_AO+0x84/0x88 instead, which was one of the causes of
   SErrors after resume here. Giving the MFG1 node
   mediatek,smi = <&emicfg_ao_mem> (a syscon node for 0x10270000) fixed
   it. It may help to document this for MT8189, and possibly to fail
   instead of falling back when a domain uses an SMI step and no SMI
   regmap was found. (access-controllers would be the modern way, but on
   this board fw_devlink then delayed boot by about 10 s waiting for a
   supplier the syscon never gets.)

2. DISP: at runtime it never powers off here (MMSYS, the mutex and the
   DVOs have no runtime PM), but in system suspend genpd tries to, and
   the power-off is rejected part way (genpd debugfs idle_states shows
   "Rejected"). That leaves the display's memory path blocked: after
   resume OVL stalls (no vblanks, larb0 stuck busy) or the display
   faults with an SError shortly after the video unmutes. Marking DISP
   MTK_SCPD_ALWAYS_ON works around it. DISP has a single bus-protect
   step (MMSYS_STA_0) while VDE0 and VEN0 have two (MMSYS_STA_0 and
   STA_1); I don't know whether DISP needs a second one, but something
   in its power-off sequence doesn't complete in this state.

3. PCIe: to keep the Wi-Fi (MT7922) up across s2idle, as ChromeOS does,
   PCIE needs MTK_SCPD_ACTIVE_WAKEUP and both PCIE and PCIE_PHY stay on
   (we use MTK_SCPD_ALWAYS_ON for both).

With these (plus a cpu-s2idle idle state in the DT and a few driver
changes elsewhere), suspend works: repeated suspend/resume cycles pass
(20/20, then 10/10 twice), with RTC, lid and keyboard wake and well
under 0.1 W asleep. The board's patches and notes are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy
(port/quigon/patches/mainline-mt8189-suspend.patch).

This was found and tested with help from an AI assistant (Claude).

Thanks,
zoan37

