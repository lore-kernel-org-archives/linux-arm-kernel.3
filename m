Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4C2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 06:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HuK08AhMaCFjkCNPsmZTrH6+PYVk14sYYN9oj8qJbgU=; b=FKgm4opBRvHAYeSrrGcMY71kHU
	ojt4MYo3cjVSRHIP8W3R9+DR68XVNpaQl0z8fXEV4jd3Npr87YCzq3arq4UGunLqgnKki+/d+nLfc
	j4vdwz0vuKuGmq6HoEMKuOY/1KmJlf0/zMKGKWi4h7qnZhyqqpHCkKGlFBGO6mjh7aS8wZ0+6hyqg
	6b6ktjgzhasM82vZr9e+0vaaTPIyEnziagKAkzSOnMKGbZ8uf9oowzmTzTZynuEZNBHdRR1Wm817K
	FXbn5YT7WbAlitg10/BaidjTxRcKtxJz4ZFAapLtKfPdA12HWtBbmOfke3ZoFTME8+LHQ3maVNP1j
	zD/OQR/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA0AE-00000009akr-109U;
	Sat, 18 Oct 2025 06:11:38 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA0AC-00000009aiw-0OxX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 06:11:37 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b67684e2904so1829119a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 23:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760767895; x=1761372695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HuK08AhMaCFjkCNPsmZTrH6+PYVk14sYYN9oj8qJbgU=;
        b=TDqBQGXWVPXijsNDKtJtwvm2VdN3Oyp+NlCoNlbzKR7PQA14iwSDFOy1v0maCTM6oI
         0edUT3vHvI385FFsx+/PJsYK3+8ado7fGlhAumiUlMzstI4zrHuB+JPI6tkhaGAbT4JZ
         1ctm3Tr5Z1Jb95ady+xDX74unu/fAHXFeeRo2Pb3vVM9sq+6Hzj1yod5TGHkUkSgEeVM
         oE40bmgzYtB3dUhsNAeHu+OwX8rfclM21ha6zES9pNPHYQy2X5O/ijssvxxrn4VsvkZs
         mBFoPYTPH7/NzWrcw/zHcFUU1q2bKhbQQskiv6WQLxytdHmjhVFIta4p7YZRIiKxKj8U
         D7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760767895; x=1761372695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuK08AhMaCFjkCNPsmZTrH6+PYVk14sYYN9oj8qJbgU=;
        b=dN+2qVT2Uzuis6RM2VyYHQkt+DCYd00qgLfL9hs87xutyCxoRhco0SJ+rVbApvCob9
         rvEC4pAgWTBZSghjN2CEbYdS+WMpJj3xKasQqM9rlE5N2XXRU74sSFL58SUyS0MXI5ra
         mS/jk6zmwc+YzjiGMAJYidZHyXc5kS02soc8g6P2BStIS+hcwHuE7whu4bwpjIhVJclu
         Tvx4lrmUtnMpEItK320To0WtKciIjNVLJ4ix9G2i4qQhFmI64M1RVm5N4MiKYEych4k4
         n/MRZRwQ5uplQOxSweoLyxgHaGuCBX7B7IvgZpHLWNytFMd4hUKjqWBPr2RMdreO/M6U
         0mng==
X-Forwarded-Encrypted: i=1; AJvYcCXnr2VemvVLe7MseB/DqOc+o5SlUcu1VlOi95ydpovCuzXYfb2WLEhHLuK4zF/B4WDt7FTxsNPcZfw/ML1lH0WC@lists.infradead.org
X-Gm-Message-State: AOJu0YxPgyPTMjX66l83N91ep0cBSZLykKEHfUXmrty9ZF1A8u7Gaa03
	6M0vtrQEoHiZU8i6lnvisIAnHeNhPLW40RnDzESWpViHZzd9qXKXINfF
X-Gm-Gg: ASbGncspTOp/NyhVIcjSTTo723QITSit/Q+pUSS/Uz4gjMCQMkml5xwZfGBojy6USDI
	gMJFQolePFQx+cQ3G6RBPCEalLJIa4rb416bXcIr/dViBGQC25QUyZt6iGdfP8HCUfwANqEZNiV
	E35VFtp+tCK1tE3FLXK8I5hGpiXzuEG++yvT/E+hAYNiCw3fg+cs579fGboP1gVC4xkOHR2cvOd
	Fav1RMeTBcySR1VwNLj8DAyE2XuzyL6EAvNaCSOLB32x1srbqnxsgUSwzCjZx1r/+EFpUkltWfM
	t+UYPdaGQ18U16EB4RzHXtuUx6/yB3H6OYtg0WgFvDBuqXhQbmdrmBK2MkCYMoSpEVxySgoAvw1
	40rV/huMmA3c0NvX5D40as1T8g1t5lACmUwK24Lv8Kru/lxlfnW5HOi/v7XI+XAEoB0KneuqGrA
	BJAzEJDzQB
X-Google-Smtp-Source: AGHT+IFD5KKQflxUKAzZp0jVPKQQRA0FESiph3hb/TkKSVtjx3w5Itu754OOQKM0Jsx0lX1D6seJ6w==
X-Received: by 2002:a17:903:1a4c:b0:24e:81d2:cfda with SMTP id d9443c01a7336-290c99a969emr82602655ad.0.1760767895200;
        Fri, 17 Oct 2025 23:11:35 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2924721936fsm14982735ad.114.2025.10.17.23.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 23:11:34 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci@vger.kernel.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-rockchip@lists.infradead.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1] PCI: rockchip: Propagate dev_err_probe return value
Date: Sat, 18 Oct 2025 11:41:26 +0530
Message-ID: <20251018061127.7352-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_231136_133024_83454FD7 
X-CRM114-Status: GOOD (  13.23  )
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

Ensure that the return value from dev_err_probe() is consistently assigned
back to return in all error paths within rockchip_pcie_init_port()
function. This ensures the original error code are propagation for
debugging.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index 0f88da3788054..124ab7b9f3404 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -134,7 +134,7 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 	err = reset_control_bulk_assert(ROCKCHIP_NUM_CORE_RSTS,
 					rockchip->core_rsts);
 	if (err) {
-		dev_err_probe(dev, err, "Couldn't assert Core resets\n");
+		err = dev_err_probe(dev, err, "Couldn't assert Core resets\n");
 		goto err_exit_phy;
 	}
 

base-commit: f406055cb18c6e299c4a783fc1effeb16be41803
-- 
2.50.1


