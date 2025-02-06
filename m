Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB07C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bKLOHtlnFeDc2mupUeHKGP84WLv0obwYAIFvImFlmgg=; b=fK/AG36bbALybJnQXSdhhH58YT
	hLuOim6tfaIBwwJ42IRRIFsu4XjXt34OmZHghAAnndIDKTbqCpClGLraPgWfaTgEGzvluD8APm7Pc
	MydIUftsPquAdo2N4JI4WHD4IJmmkoQvUSyowA78kQ8SA7U8ZNsXJtgT5LU6lX7Xf5Lw9xSS4a/LZ
	IelMYkFl7Mpa7athF7dNIlQEc3NvTk4iVNBRzPbes2HnSqZyJG6NOnxZl2DYhV9J+YnuVCKLKg6Ji
	6I6EyJID7QwRQvq1/dsSHECquG+t7NbrbloI9tLPsSPk4TccTHh64m3rZoCsXBKMLRcObqRNDofSs
	xuZQUEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA5g-00000007eti-1bpA;
	Thu, 06 Feb 2025 22:11:20 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA4I-00000007eeB-0gg4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 22:09:55 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-71e1158fe3eso846805a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 14:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738879792; x=1739484592; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKLOHtlnFeDc2mupUeHKGP84WLv0obwYAIFvImFlmgg=;
        b=Wl8gxVlTEyvwSN1BHJe+/er6f6Rjj6JBubIBdmPeA/OfWwfW7Zo5iqmwDqXgXWE4KS
         CNhrnrTDL+GJke9TKqbAlZN/eePOFUipCKMJK+V7QPZpy3fWdQVhaXkIx/inX4BSsWy7
         FLWMhuAofLV25Jh7SvpU9PUTdZ41x10Rsr5ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879792; x=1739484592;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKLOHtlnFeDc2mupUeHKGP84WLv0obwYAIFvImFlmgg=;
        b=iF2QguS/+W0cRG+yRi0wlFRXVjjNiPdLEV4Tu1Ma70yL+Ti2qHohISB/01nHtKaczM
         VATzyAA15P8fgXNDoYiP1Jdm9hnPjh7TO70vUSNFSkKNM1uX5ozFjF2yNBBT0VPb3eWC
         KQ91kTP3xjmR21Pve1vAAgsfKmofVTTpuVnaIdbQJP3QuOpGSA5rXPca6/R1w6zabSmE
         WvQ5NC9A+70PtHOXu17xGQAg0Ak8/e0i52S3eMK3QnoWQLUVXnoefwj5sl9gL6uNGSM4
         rcsuOYC0Y0Jvp3dIdynhLqEouwbdrlyedkjgJsTHtFXzfDDSfl0xtS3OKKQ6nXHS9GLH
         iHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGN4fBJ6OzPGMxiThbn5Ua/7KfK8UVXGDAVsuNtVdPsaWoy44SNkqy7MuECrO9x6mGXSnZBmWSfIsubszXq4QQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwKMalgH8rs1qhJMIbRfPybc+R0bobd8+YNClhHWmL1/V7zS++B
	W4sCNNVSRA3LBSPQ7pZfEf/Sr4UUEYUG4rEMsctMJuMBowZQcD82SEfnzIX1Aw==
X-Gm-Gg: ASbGncvaIkbtoGIS62gt9I/hhktssOkMa4y1mwRjZU7Seo6eS9t8MFjrQ26/GoNLsTA
	/KYX2vc/RW+1sQ1H6cThO3gQ8GsdgPL/gsCGZ9U1D/xxf0Rbe1tIG4ZrG179/gR4pSRMTs3cIl8
	0pchCTDnM3rKGCWYRu1trjXIVPKlEgBI0QTXeTUU0fKUiiJp8eASoOLroWWblbezsLeuKQFpcWs
	A7cg0clNcZf2Fqtayfk44KYu6NU1UpM4vAdABSJJQwhF9OMSpAxPW/BftEGlg63NM5T8yct8XNb
	LiPOD8O8VyA8DQFQSoYOaqYB2dWCA9WgWFEIiaFbRsmMicBVv4U=
X-Google-Smtp-Source: AGHT+IEHe1IPoheKKxZVoNH3Y4DP7iwCSU+DV5NShn+FO80wEUB6babC+pZZtSNlZsFF7OFhthUckw==
X-Received: by 2002:a05:6830:6501:b0:71d:eb02:bad6 with SMTP id 46e09a7af769-726b87e7d24mr712227a34.13.1738879792140;
        Thu, 06 Feb 2025 14:09:52 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc544cf88esm454109eaf.15.2025.02.06.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:09:51 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: ulf.hansson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	adrian.hunter@intel.com,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
Date: Thu,  6 Feb 2025 17:09:37 -0500
Message-Id: <20250206220940.10553-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_140954_236134_CBA4870C 
X-CRM114-Status: GOOD (  15.41  )
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

This patch set adds support for Broadcom TZOS to read and write to RPMB
partition using synchronized access to the controller hardware.
To achieve this Linux OS and the secure TZOS make use of:
- shared hardware semaphore register
- a set of SDIO shared work registers and
- IPI interrupt registers
The sdio shared work registers indicates next in queue to access the controller
and current agent in the queue. The currently running OS that needs access to
the controller puts itself in its slot of work register and if its next in line
it can try to grab the hardware semaphore and complete its mmc requests.
Next agent queue state is changed under the hardware semaphore lock before it
release it by looking at work slot register. send and receive IPI interrupts
between linux and secure world are used to indicatecompletion of transaction to
the waiting OS. TZOS has its own RPMB driver which accesses partition when it
wants to read/write RPMB frames. Current implementation assumes Linux and TZOS
as the two work agents. 

Change required adding two core mmc_host_ops request_start() and request_done()
to let the host controller driver know when a mmc request starts and ends so
that the access can be synchronized. This has been tested with both the sdhci
and cqhci access. Currently these ops are implemented by the sdhci-brcmstb
controller dirver to acquire and release the hardware semaphore before and
after access. This change to the mmc/core driver does not have any impact to
existing controller drivers.

Posting this path to get comments on the initial implementation.

Todo :
- Provide  hardware smeaphore using the harware spinlock driver framework
- Use IPI send receive interrupt controller driver

Kamal Dasu (3):
  mmc: add request_start() and request_done() mmc ops
  dt-bindings: mmc: brcm,sdhci-brcmstb: Add sdio sharing support
  mmc: sdhci-brcmstb: Add rpmb sharing support in host driver

 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |  16 +-
 drivers/mmc/core/core.c                       |  14 +-
 drivers/mmc/host/sdhci-brcmstb.c              | 275 +++++++++++++++++-
 include/linux/mmc/host.h                      |   4 +
 4 files changed, 303 insertions(+), 6 deletions(-)

-- 
2.17.1


