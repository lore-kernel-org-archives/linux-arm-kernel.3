Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yg1c07mHuEVEndX1mN4EPyk/YfVVe6WLz5FXdYEWUKk=; b=SciVvcsCqD8pHg5DkVF7Ut5bwd
	FleAwzaqkipyblcqjPFsF2RA6Kez8WSnTtRRwQaeuM0qrADSVTYxpmD7x1WmFxUnmMEddZ9nc3777
	76hHFwlQzN/TjdG7e9h8K3bgMTVqCv0jqURm0ltK6JoJvNfOnljHoiar0TYps+wK0zcbzG0dP7TiO
	Aj2YnzulVvpffbds6gZAC2KhpanTfDBFWlGkrZFBByxKfwRoniW7NYGfSVJdxUnJgNgkH+NinE9k6
	0rlvvdrIAeD+ZSoeF4wvHVDPnROh5jGbPDu6HEPaZg/D8PiUdkoUbi3J1dOysggJ+3xZ95DYdYmbj
	7pgZkcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnA2-0000000CAuf-0YPb;
	Tue, 13 May 2025 10:46:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEn5c-0000000C9eR-1zdt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:42:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-442ea0b3b46so914965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747132943; x=1747737743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yg1c07mHuEVEndX1mN4EPyk/YfVVe6WLz5FXdYEWUKk=;
        b=eNbsMPS8ba0ct19Hr1ZLMEJg1K2i2DwCzjhCYK0R7kn+zK2tVIC+tnjoh5T6/CcT5/
         vg1rIjkzJ1tfSUrgYAldaRrTijocohReWH5iIKSsGIGsNMXYdNs19JexKFXD9alaiGEC
         CYxDepDPcMZEcgOrsukI3aNx+qFoqwkpPYvTB7ZKB1BEr4gVeaeGEcgzWCL19zx075V7
         1m40GRspVdWRyp96mdYCFLo6Da+Drc6+uykS1grQHhBNx498S8XGB15ZyZ+6wptEzVkW
         uY3cPfwnPkLFpdVjIVP7YKD7uGDFXEwBDV30uIMQ9KlbffjzyrxPli9mEIVzjuODKW79
         MnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132943; x=1747737743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yg1c07mHuEVEndX1mN4EPyk/YfVVe6WLz5FXdYEWUKk=;
        b=G2bhzq78eoejHLKwCt5idSAZtrd5POZgqZGWsfAEdVFlAFOSjamPPyFhiCy7t+1grg
         acF6j/ble+xJ7brSvJtMzA55ukjO+v7qhql3QX4RxkyucyjminmLHYIwBx7Dnw31q4G0
         XyCLp+m58Of5QsqjwRWX9rGyvwKApK/nBfPyTIZhKmDqbTrRTXPMU1gNLB9/hUCdmS/7
         92miPOi2e4WHqB4B7JsKpJ+lRs6uIKUbhNWerHoQ6pqYZaGisCXt7nhmRljFr4h1mHVT
         bSScMp/8/MAPVNzMbKXSWLmq+SjcBB+zBXyXasndT3Dy3Tt7WYD54YOaLYkRMvCPIayn
         EXJg==
X-Forwarded-Encrypted: i=1; AJvYcCWHgrCF3TnKh+8Aku4V0qVZvXjJiNXguooZueCIp06cR92jqQj/R1tjBiQ6HgZ4VuuILPSYdv0DMZWOp9L8F5Bt@lists.infradead.org
X-Gm-Message-State: AOJu0YwAihhlUWje/fJC0MynnbKpx2oFs1+BNzcjpbapIgHHYMpBZoQT
	cdiLlOocdhOzi6jr3076XNb+egKDXID5aH+iPM/SAECNQbxvRsNxS/kEwlHd9fk=
X-Gm-Gg: ASbGncvxa+r3rV2X+ZHDkMcqN5VUEraz7ZBQOiA+JsjlZi/FYPU/0pw0lRnRP1BsWvM
	jcQ9SoTsgFyC9nyV6GzxUDev/1iR8vDaAA+LJlaZ1D7fKsZlvwQopm+fK64lDohjwO7FA/I0cE5
	zeIWLx0BX8uc/D3vSOozdbqn+d7QltJIrXVBj0qbb2IVO1P7nxsviGdDM4t3aX1s0WjbGsFx1Tx
	P7m8wa0p0cU8dIfJEMHzjRO2nUy3iMTzrkAH2pl4lwqJ53Hd/l+3fL5zWv1Dr2Sg+luzo0bRQnR
	rac5sz2oVGHN75DW0gpZULkZW7UMYeSZWAVkcD8+aLV9650Nu1C6JG6YiFjEFsoSJn2d5YTrY5u
	LvYu5xHnDw6cIkE1I+l6ypEqfFnxOliHjoW9PIf0=
X-Google-Smtp-Source: AGHT+IFoNiPxCt+CMN4614Hku32Rt1pWZtS1Ab8LgzEA8q/WGFVYaj4V1uUDGQcXU9uLbt/oeGpLVg==
X-Received: by 2002:a5d:648f:0:b0:3a0:ba77:fde with SMTP id ffacd0b85a97d-3a1f64589camr4267133f8f.8.1747132942873;
        Tue, 13 May 2025 03:42:22 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm161002435e9.37.2025.05.13.03.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:42:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] arm64: dts: Cleanup DTS for v6.16
Date: Tue, 13 May 2025 12:42:15 +0200
Message-ID: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=pSmfcyWrGiF4xpTJTeN86T0ysr03H5rq6eBj1nDatnc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyII5bO9UDNY2UW41YhzGm3W79e2lPorMhsUM
 8laVWkGUX6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMiCAAKCRDBN2bmhouD
 18KQD/9duw6hJzlxO6+orDMVLJW8i9K8mDq48xhYYD9+R3ihDIi4P0VwpwYzTj1V9UGm62DpLQ1
 TbVa4C+bY6Kbs9ZzECfRFcJjHsowemsuuxSTB3juYMXN6gtZmrplovDL+vSRZqtlr1kKQ8dTYB3
 Lk2QQ1SPFsBxsAghduP0jhgtecoLh/BfM0piYXXhL2LtYaOV/ZYQVL3USecXb5gdEbBmcW8Dh4+
 QOhSl2NTx4cKibXliq18QZa74cDUdPVOFyoJp54xu2YdlQAUTSodJs9hzZAAg+0kKOTKZisvzaQ
 xI1Kvn16BVz2c2vAdkEDj4ldOk8MD7o5eHN0/uiZiRACZBducpnUW1fvBWGKvMlXJ6zBOmGaygf
 DNrXGI4m/sDJKfV0YVSDH+lnWexQk6cn+3tL/kS+Nr9+xmVPEKOVry3kqlpfbPDMOW7c4XJPulJ
 bdKm4tMUQIyxja3vOvsZbH5m5D/JLzlC5y9wEm8gqpPkS3GmCIgHf/5fOMe5W1LJbDAEnpIS6lo
 akRuP1GMrDwesERkU7c50LPyO95SMWPIN8PFIaAiBroR326pTIAg9tugvdEoGW+dRj3Cov0JxN5
 8zMa/TlEt+HKeOBQdScbgr+b1yl2z3r1ODgttSs8vbjqMDv2hUqUDPoOfuTAQ8UCI0qyC8Q7PcB JLuiWgou0/eQqdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_034224_514422_50099A29 
X-CRM114-Status: UNSURE (   8.78  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.16

for you to fetch changes up to 04e7638dd64af20e4e81b7569abea9673e337098:

  arm64: tegra: tegra210-p2894: Align GPIO hog node name with preferred style (2025-05-05 21:22:25 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.16

Two cleanups which were missed on mailing lists - align GPIO node names
with DT bindings for Mediatek mt7622 and Nvidia Tegra210-p2894.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
      arm64: tegra: tegra210-p2894: Align GPIO hog node name with preferred style

 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

