Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFA8E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HT5Vw1c5JsjdkFWM9Rgu+pVa9jSJRpnur3CjtgBsZuo=; b=ry+jKFV0ObnWlqJAmA6K4EUmox
	lL96d9psQ6ma0IDnUMmsWqDpF66C//uDF742r/LUCaXnqL+h+7H1AYGJVsGzCkOKiQ0dsB+cWluCe
	b0QCRRZrI+zjMSyheJ72SMMiPSu5fVWjiuogohE4EbWdPcGFezaxmfy+wDA7b5d1Ac5Ls0dH/2MXx
	CYZCn3RJN4N0ms/E6Pm/3JhYVRT9MYMDQa1Cc5fY69w/aJSfVmuz+Sv4LZIm3XbgufyJhuRsnDLTm
	CpP/TfipxdihkRTG8KFtXa2bRqMKAPhcGnkPwFf8oFL9Eey0d/XnnzZBjWg4kGmzqM9ky8j77Gtux
	/4vZaUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKukG-0000000AZFs-3T0o;
	Tue, 10 Dec 2024 07:33:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKujC-0000000AZ1z-41LA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 07:32:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-216426b0865so17889925ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733815938; x=1734420738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HT5Vw1c5JsjdkFWM9Rgu+pVa9jSJRpnur3CjtgBsZuo=;
        b=QLc6cvVxNNm0HQyWqzH6YII3B+3IKdQklE+LSYU+r/0RkBFI0k6ku5C2A5pph83MMo
         q2g95iAP0NPQyHCHd18soYXuk9bn2ScQjRwkKmfgkTUJ7IFyuFgk5YsBTFZ1KzS4ye9G
         XAc6w7psqW2kYPZ3djXXo+NF8XJnQt+geyx7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733815938; x=1734420738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HT5Vw1c5JsjdkFWM9Rgu+pVa9jSJRpnur3CjtgBsZuo=;
        b=hmYzXEe4adr0XQE3Lh+ip12Pe3bZdR3EesJa8W2wE12VryD5VWRxOcfBFXBdqn2+35
         YTiULI9y8g76fA77KCvjzyVAaVcjDspxidI6zY0/isBQtv4ZKfCoBXlJpwTALX/9RDPZ
         RpY+j87lczK4cjiz9aVpRCIveymo4IqELC0nf4OeCxeoxZmCrH2NEASHUH1ZUfX8AFoi
         LvfcMo1+iP6a3xgpUQSi3a4JZUHY/zbKjJk8D+BnrANa5w9mrtvjFMtiDZSLzHQEHyRr
         RgaQUqTasyccm8x7Wk44hvBuHbQ2NbyQuhWioFuhWQMGgfwe2qjRc3ESCTqbVom2bJZL
         RUTA==
X-Forwarded-Encrypted: i=1; AJvYcCXGGhZb5PIK6VZECj60fsIMQplVocBPHG97zDxCv4L+gBI7YjCdrvkPeOMg0rpjY1nNHSfECwXzj4VV835RGrcu@lists.infradead.org
X-Gm-Message-State: AOJu0Yza8IAizrhboWwnEIAl20O701Mld3HwlzIdg9IRIb+ZPdjaQaYi
	dttyFK2GN+R6PSS7CyNMgxxtNhunlTm7Q6L88RnBaIx2w5hY5eEgHy54+WPyYg==
X-Gm-Gg: ASbGncsdcHETINEY6BmGNuta62bHT9NAbPyfSGyn8BQzfb3892mREoGeBOyTncXt/FN
	8/ndN+/0BJpnwZRvA6wT/dEp51iTP3WWrYwazsLoLX4fH9pUYVV5aWiVa1d0CNnJe8di2E6AN6J
	AZ+keb3CKUB9yMuesrPRjNypqn+LFuCnZozp5pyD7dj2thj9v8BmFG++dMnyaQlOpwk1HVpyQI3
	/1dlNTw1GpjAGqrW7U/QEmSni/0N3R4zfzpIg9zMz/qI8d5tADeWK1LtVhEqXl3j1asz5+v
X-Google-Smtp-Source: AGHT+IG1WT2JNFtTZJQaCDx3/CWxE46vDhlGZZ513ZUlC7xM4jD1E01HlR26Ok2ltxq903JY3J5PNA==
X-Received: by 2002:a17:902:d583:b0:216:53fa:634f with SMTP id d9443c01a7336-2166a063a7fmr51209325ad.48.1733815937970;
        Mon, 09 Dec 2024 23:32:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:89ce:2db9:f7d5:156d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f09146sm83693295ad.199.2024.12.09.23.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 23:32:17 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v2 0/2] mmc: mtk-sd: Limit second register range to SoCs requiring it
Date: Tue, 10 Dec 2024 15:32:09 +0800
Message-ID: <20241210073212.3917912-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_233219_117467_3D55E92E 
X-CRM114-Status: GOOD (  11.78  )
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

Changes since v1:
- Added MT7988 compatible string to list that needs second register
  range
- Dropped comment about uncertainty of MT6779 from commit message
- Picked up Angelo's Reviewed-by

Currently the usage of a second register range for MediaTek's MMC
controller is seen only on a few platforms. However the driver tries
to grab the register base regardless, and then ignores any errors.
This makes all the other platforms that don't need it produce confusing
error messages.

Instead, make the driver only grab the register range for platforms that
actually require it, and correctly handle the error. Also fix up the
binding so that validation of the "reg" property is as strict as
possible.

Please take a look.


Thanks
ChenYu

Chen-Yu Tsai (2):
  dt-bindings: mmc: mtk-sd: Document compatibles that need two register
    ranges
  mmc: mtk-sd: Limit getting top_base to SoCs that require it

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 +++++++++-
 drivers/mmc/host/mtk-sd.c                         | 15 +++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


