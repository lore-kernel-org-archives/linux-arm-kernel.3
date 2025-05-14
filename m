Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D1FC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=; b=XzMeKsRSuGk22E3Jyc6q01m0Bm
	6qAX7yQo4cq5nnchI38rhp/C0F0Y1rcqQaP18a94W/PYN/DUtWpOCdTE2XBf7L5k2CzQ6kzPEgMO6
	Qq61X7eAAyUX35ZWyBmKarT931BjAu7kLO0j8Gr/RbwiyO13N3mCjgpfzK77KE3Hg1KSj867uosLg
	TPhEjc5eoBSRKZLcEc+aR0VJ9misqKb21UFoYCcG9vjc9ha/J2pf9iJCvTmdzPr9+o9Wg5hCUuG8e
	cG2LZ2aDiPhMwz0cMWT10vPVoodRVWYcnZMu55VAKZBK6V4WzV0jOjsB7n7fZRXXvRQ8fI0OoDy5E
	nc67KPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHDa-0000000G5Yy-1Ehn;
	Wed, 14 May 2025 18:52:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF1x-0000000FlKp-2pyR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:32:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a0b9c371d8so5993306f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 09:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240348; x=1747845148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=MUts2I/cs/ihPZPrJLK6J/0wLyewbHMqSkvCfp9Col94FSGrLv3eWOFEv7T/NidEyw
         F2WhpaUgF/FQNf0S0XnNDUuj/BHY7fXbtON4xv+MjC20wcro5P6BvKRSKwTICn4HErBM
         3LwlwXvqC04KMb7papf13U1HLlIYSkGDjYY7FvIHxIekJLOTGE/FcbKIv4CjVDmzmgD2
         rUnpB3mf5U1920LQprixhjTS8xFIjhoU5tlQNIv6sRdBn7/soxpm2zKaJADPB94c0xJk
         st928x3toeqCWoUHqJsKUah1SIRSRDPlX/+hsEG7X7tr5SK2BNfrudPICg8DoZhQ6vDz
         i+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240348; x=1747845148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=CLx6ZpULsSAiFeBomWeWcLJpAMkMJFNbsXeeERCmZ7QyU1e2gnAMf5a0n2yAU1WAnc
         Eng6/xJQwMDxTp14sRUDv/Lahx8Fi8IqyGNxMOBKUu8c6nV+CwtF0kWBFK3I823mSTpP
         0pLkKGR/azzx8VR8bLqHuW+rgqErCaxhaFW0oB2W03pFd0cPTzozvqC5XLiakiMCvleN
         leOIxEx8y5eIW2Hs/tB44vz3ovUWtsJkC14lqMvSubq5HMFZZxs14s2J/ynRiuxYKT2x
         5qanPeCSg8oYTMhPrfuLZF3L4CMNZ3lQ46k4mSpxI+Q2z26yve/glKoWSsYbBSgOg/s0
         A1PA==
X-Forwarded-Encrypted: i=1; AJvYcCXIgTF++SlMmuhGJNU7NjVkubpWW42ch2uDK+ZIpzrrFU6vJ9348bEpK4AZkoPqDj0VN4hkcZCVPOQquRGLPO9L@lists.infradead.org
X-Gm-Message-State: AOJu0YxYxSg9qzm2vTTW2uK/m4qjw3cha8w4W/Ssn6TrXCVT2IZDPUen
	S+jWGqiRftSAwWzKtvhlsnxX4DZqA5YTYeX9Bl7/9edltF6fnVzLmbObokFLug==
X-Gm-Gg: ASbGncv4z5TtN3SbepfDYTqJurqZZEwRNxlnOMh8w6cUH6awCHiZYSLJIL/rvzlOZdw
	kTFdYUPJex/thTt2DN9DnBzP+o+dRvUTQ8kP7EHQSRXq9xx3eyxMhXxd/Wss5/Paj40RfnAC7z5
	GJE9KDtEmSRFcCIhVyxoThi3nfag2YOVKbIos3vSn/PAtx8hTN9a1wSg3cTCKUloATx/DDhF0ym
	paD5e35BZ8ZtyL3pzilLB8YcTStJ8jZGY8+yWEV7ErRXNeXMKYTeBK2e2GF/C2P37pmOZzrtms4
	18VIE+LQYC98pkd5rGblE2q+b+4j4lEQIl/Hi+kr6UIAHizV6pApdFyvYRuIz75hxYzn4CjVxYj
	EQoMF+sS+nt3y4NS45hNwWwwzGw2bIDUkoofqjFn6ZA4m
X-Google-Smtp-Source: AGHT+IFn3vXnS6jxMSTKpvWwf0YAtvDrlGdswD18OpUum5KMQooxsvMQxaV39lTehJR9+Ij2bnRE1g==
X-Received: by 2002:a05:6000:4205:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a3496900a9mr3428305f8f.7.1747240348003;
        Wed, 14 May 2025 09:32:28 -0700 (PDT)
Received: from thinkpad.c.hoisthospitality.com (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm37650875e9.2.2025.05.14.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:32:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: dingwei@marvell.com,
	cassel@kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/5] PCI: Add support for resetting the slots in a platform specific way
Date: Wed, 14 May 2025 17:32:23 +0100
Message-ID: <174724032611.26337.10095399338390897616.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_093229_705692_BBFDA26F 
X-CRM114-Status: GOOD (  12.91  )
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


On Thu, 08 May 2025 12:40:29 +0530, Manivannan Sadhasivam wrote:
> Currently, in the event of AER/DPC, PCI core will try to reset the slot and its
> subordinate devices by invoking bridge control reset and FLR. But in some
> cases like AER Fatal error, it might be necessary to reset the slots using the
> PCI host bridge drivers in a platform specific way (as indicated by the TODO in
> the pcie_do_recovery() function in drivers/pci/pcie/err.c). Otherwise, the PCI
> link won't be recovered successfully.
> 
> [...]

Applied, thanks!

[1/5] PCI/ERR: Remove misleading TODO regarding kernel panic
      commit: 0b56264b66b695aa76115ae68c1365dff80814e0
[2/5] PCI/ERR: Add support for resetting the slots in a platform specific way
      commit: e2889025d83fb38faac80d976f1789af3320ecb2
[3/5] PCI: host-common: Make the driver as a common library for host controller drivers
      commit: a811ffd43754dfcaccff497de1d8ee0bd30f8f2f
[4/5] PCI: host-common: Add link down handling for host bridges
      commit: f24509b96c33c1bdd9cc57bc4f8a58391e846c8c
[5/5] PCI: qcom: Add support for resetting the slot due to link down event
      commit: 40eba89968afc15302fa5aaef207fd9ccaf1ecb2

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

