Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EC4C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lGsNFf+UfdU9W8kSubEW5P15Pc45666u5Nv+Ism+9VE=; b=n8YD46gxiILmiG
	mYkY9GjmcI/eXIf6O3tQ/7trzl/yzaq5R94IyujL2604FQKvMhC/gf50iQswwqSOhQBvf5wSQvrBa
	FHC+a/LaN8ts+2WioraUFTf8Lj3z72y0N7u3vE51he/S62qMpwn+jr0L9OjCnxE081txI976WUWYa
	UMFMMzEVP4h4JB9t+u7UPal4Z3lXNUIUAk3dKgYERORJw5Vl+UetYC3di+vtxsMyqUAwoEC62rjto
	zQsqwujY2l0SEynyMhIV2qskRQqCT4dF+80O25a8B/1z7XoakcUcA6RJbF7jCkWxiNCuka+4sX4HG
	vCPNEYVju9wsU7red3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4vk-00000000kft-46VG;
	Mon, 03 Mar 2025 12:29:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp49f-00000000bQm-33oc;
	Mon, 03 Mar 2025 11:40:18 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54954fa61c8so2924875e87.1;
        Mon, 03 Mar 2025 03:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741002013; x=1741606813; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lGsNFf+UfdU9W8kSubEW5P15Pc45666u5Nv+Ism+9VE=;
        b=iKMbC8X2ZVIR4sL+Y5fbRT1OekHZ8/ByYNlaZjk54coEkfPA261TbrqriAiC3dkP3K
         UDHFDwd/8pN4HPIbSgFgalNXmDxtNKHId12b/xKWLJm7w5SPDxdwhhaTKdh04kEG54V/
         889kkGN9RPR8+OMlJVucujitCPAHSMBhYc1fczVzAd55Cst+opoutm7xE5JXy1u6VX4c
         +vD/JWTpqgGB9G5Bv/l+sPOIwQe1Pc+PhaibXw7Z6lFtrBhCrhSH/TAaMj+9QsusU7MQ
         lI3Wb3knwJlKgXoMOPGWDt64q0RCzFTsZ7iRQljub24GiYWjMp/TILDpBoLQVJIgUgjJ
         GWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002013; x=1741606813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGsNFf+UfdU9W8kSubEW5P15Pc45666u5Nv+Ism+9VE=;
        b=gDHE/C5J2Vvw7AWQTrwE1DWjptyzq482FZS+2hH7JDaVu/tZDiHKqwfPJdRahGrkIu
         wkxmaX4cSqytaDYSQD4qzRGaWoATk0C7ZSomnr0giqF7qqp84TEqeAxMEA8yovAv+qDm
         yYgpkJC4fCIYIRP2wVSXuqtJqZC9ALJIQuO0MrFDSKZ+Ler2bWazcGaX9lOAgFCmLLVy
         z2h/jdubyxFPRk20PUL3cNiO96RFiTibQZmPHR+/cQtm21B+4qQXXix22FGWY+EZRqtc
         7r17jSfqA8aJlGSYMIz61y3wsdAyJjNuPjSOS0umDPELi4DInd1GOdrhQ1W3RP9nyTy8
         7N/A==
X-Forwarded-Encrypted: i=1; AJvYcCUb3CIyn1vGVdSy8Gv3fNKut5CSLX1aRd99TkkWf9eH6v60fqcWLxCQF8DOmE5OBg98bMzU1DPh/6eBu1UAXyo=@lists.infradead.org, AJvYcCVjAINqRHPygDCIbC+06kpW0e0kcHsgxjpmeKldTy0PWOFDbheskPLkOA6Zp7EDa0t/fKPKl5EKKRLLEvRhIjIU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy22EBcU3PNRentYHZKpYUtDnU4qBjBCjbQuJTQM5M4ZjZgxWlr
	cfPg5oVUfJGBDbZSQGLcTKYnGA2+5SEwwGkOU0bj9/VL9/hs8UN5
X-Gm-Gg: ASbGncs271b3t5ydL1YhddAqguPLxnwDYYNtasw/Ga/z2ra57Y2EZh/AmVl+6WAqx5Z
	joNEGv4cEBWO+ksFVoKix9UmhhdTduFY+9BUYyIYEzg2+aQV1KMy7Ul+WqX2C1o0atdGqDmvUWN
	kkXMf2JLK8Qqr0dCc0IWYrQb8bzD4KCyO+8igv/XdpJ1InIaOPAFz4iRyHa9gv+2HfpmgyY+oZG
	fI7BGuLexbi+6h3YLKkM4zrtyEm5BZVp39sJWvXyp+7Q6CIV+7aUEnB+k/M6qS923YKLGbqvayw
	rKHdV2puIvW29Zq2m9hEqe0YvZNmo62I8zUz27WBiPsPuaDTggJk9N93gRqb0ZElcyGMRg1PmlO
	c+dYExZFxSman8qK3AQ2jRMwDN4Dj6S2t10eJ9W56
X-Google-Smtp-Source: AGHT+IE6TYJc7vhbUwCxB48YuKMrTqXMOVFOkYXJN/faNQ19JttNP6FSxSJOeitCW88+hzBFm5/lpA==
X-Received: by 2002:ac2:4f01:0:b0:549:1c87:af8e with SMTP id 2adb3069b0e04-5494c37f6d9mr5827800e87.37.1741002011703;
        Mon, 03 Mar 2025 03:40:11 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54949de706fsm1125399e87.23.2025.03.03.03.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:40:11 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH v4 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Date: Mon, 03 Mar 2025 14:40:08 +0300
Message-Id: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABiVxWcC/3XNTQrCMBCG4atI1kYyk/TPlfcQF9N0aoOalESKI
 r27qasiunwH5vleInF0nMR+8xKRJ5dc8DnMdiPsQP7M0nW5BSo0gBpka2S8uDRKH7wNA0f2d0l
 dyZWtqKxbEvl1jNy7x4c9nnIPLt1DfH5WJliuC1goUPgbnEDmqZagNH0FGu3hfCN33dlwEws44
 QqB4g+CUklVF5qB0CjAb0SvEKz/IDojLfW6sU1TdUhrZJ7nN/E04QhCAQAA
X-Change-ID: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_034015_786534_4E54F9B8 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

This small series adds support for non-coherent video capture buffers
on Rockchip ISP V1. Patch 1 fixes cache management for dmabuf's
allocated by dma-contig allocator. Patch 2 allows non-coherent
allocations on the rkisp1 capture queue. Some timing measurements are
provided in the commit message of patch 2.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
Changes in v4:
- rebase to media/next
- use `direction` instead of `buf->dma_dir` in dma_sync_sgtable_*
- Link to v3: https://lore.kernel.org/r/20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com

Changes in v3:
- ignore skip_cache_sync_* flags in vb2_dc_dmabuf_ops_{begin,end}_cpu_access
- invalidate/flush kernel mappings as appropriate if they exist
- use dma_sync_sgtable_* instead of dma_sync_sg_*
- Link to v2: https://lore.kernel.org/r/20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com

Changes in v2:
- Fix vb2_dc_dmabuf_ops_{begin,end}_cpu_access() for non-coherent buffers.
- Add cache management timing information to patch 2 commit message.
- Link to v1: https://lore.kernel.org/r/20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com

---
Mikhail Rudenko (2):
      media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
      media: rkisp1: Allow non-coherent video capture buffers

 .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  1 +
 2 files changed, 23 insertions(+)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba

Best regards,
-- 
Mikhail Rudenko <mike.rudenko@gmail.com>


