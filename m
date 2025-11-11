Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5198CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2nMRTEYBnX0JEevXqRH9dgEagWBl68PRNtodA0SJ4g=; b=UuJZuVG+7gx95MjM0IfTWXHRET
	klkh1nfrWCP7h3LLwOuccJxu8frv+x9jKYZ980KtbbDLM7UyUe1TM1NmTAd3O+fI10n91Vx0rcBy0
	p6sWt88aYlgIuMmB18+O96JIUCtAyGldNkJIJ8oclE1/YqWS5LI2GQTS9P/fL035ppRI9nLaSTXnK
	NUPz9irIDpv9ij55ZFsb3XMThgqLP1kFRtVDLmlaKF4ksQ4JQddD3XXdNnZ9Fx3Vq339PnnKh1yvO
	GzLnBpfSe1LSq8OnWOtG7cg4cpROq7hsAFKFMlWOOyQTr8lJU2pX8Ht6Sgwka0O5ZxcBLFrGq22J0
	MN5vRiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn3h-0000000783C-0RCU;
	Tue, 11 Nov 2025 12:01:13 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn3Z-0000000780R-2Oz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:01:09 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b72134a5125so599890966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 04:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762862464; x=1763467264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2nMRTEYBnX0JEevXqRH9dgEagWBl68PRNtodA0SJ4g=;
        b=Rj6vZzReTZZI+REPu5wZplJwAn5MZqO2siPfGt25jNyY2WOfOD2BCJ8L1yEWzHmcwM
         o0/R7IPVDjIQ6nanYHXoCfxZ1OKeoqVjLzlBGPb17Ic8VNKOpY5aEmuGMBqJ/yqBgmJ8
         5N7BMb4DjxYsfuErW9t+FHFDNL01OFIUOVzm6wT1OF2OZFfKDGnEF0hKgVGk2ouDswOR
         LCQQrmu2Huv4AydKMUzJTh7WfmqLwJB17rDAlFCo7Vijt87vbJmxhwyo0IYKU3vniktz
         W5o4umglHSwn+vNVOztiTtdyPnE6zjeOdASRH+jW/oeLR1539CKisQOxg1Ri2WFNqyya
         QCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862464; x=1763467264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j2nMRTEYBnX0JEevXqRH9dgEagWBl68PRNtodA0SJ4g=;
        b=NRmU/Uu31TziXM8+Odz4ZzltiYdndlL9FF+IOfg5qZspG8jvsmMzotjISLfphbky9r
         lgxpgi1dxNPd7Uuk29siGW7yqwpOqSAe0LA2ly8kGwhhozZegtACph92dAX1VWGw+LbR
         w3q7sck6aCICsTLdYcJ8MpC1ESHSRTfSjMaYJ49agKEIZdJyfEeZiRm8wJpWYaFMNZt3
         dz4nU11XZImCXDWF21/LamKddLBF677AFqDRcbTLJ4hm3+DGoKv+lKVXKHWb3s4XFsSn
         P0TEbqySZPTj4Xeh0r6RSYa/03PG1MygR1i5WtJfUYQ1RPaGLULRZ6VoJJWqlnFBGgGA
         QVaw==
X-Forwarded-Encrypted: i=1; AJvYcCXjCnKCnUjBvxKppLUwgoqMXh9fM2EBDjTVot4AyCkfOcYMUDtQ27uAq3wNV623DJFLapQmeXEpBYB31HKyrwqr@lists.infradead.org
X-Gm-Message-State: AOJu0YxpGbKwpxHmA1hA7meHUzN4W3OZysAqL+2Cm+X6dBn+lx0V+LnX
	cXBeWx5EibrYjC+4IZ7Jh08f9ewpPhqrWEjTUBhK59/ksBLRxsuFDkxj
X-Gm-Gg: ASbGncvPddN523xQA6dFhpzmzUvRY4hPn9jidGtLIomoknmTU1wBSkQxqW34bqAJjq1
	QVa4BmCOob+4vWqLliuwUKKn+s4qHCEG52vuBWeQavyqw1vwnq0zy8UdSTZiufwnTsmrBLNgL9i
	jqSxkZTxnlQL/iRpdI6lwMZDciv6mqKkD0h14DkP8NPNhVMyL4vUPOm9YciUNg3ztCQNmraXJhm
	sw9pM39aT/vEYSJN9bBoGRMDs/X73izxg7t0E93H9+/ik0Nw599y5TNs3W77Z3Mc4dR0YE2YF8w
	fBlD2d6VnCQn42LlSSVwedp88RfINFm/OXqAu1NuxuC59LsYeHTzObIrgplJ5cSg/c7XfK4IVZ/
	q//X1n31FatwoO2ZvUJGgHrRXEi0X5ayWNjlzOJCTN6P/C84cTtLCZIPeuueXZQjjovx4k7E/8T
	4Ph2DoY4SZdFVACXr7oKbrCUkUHA==
X-Google-Smtp-Source: AGHT+IEMFjppQxmpKPUPuwI5Eh8CB/xzwrQb4iSasl8juRp6TAOQ7ALPukt/vhacoC4tWko/18/7Eg==
X-Received: by 2002:a17:906:ee8e:b0:b71:1164:6a7e with SMTP id a640c23a62f3a-b72e003924bmr1291166766b.0.1762862463417;
        Tue, 11 Nov 2025 04:01:03 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf407a01sm1340707466b.22.2025.11.11.04.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:01:03 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: defconfig: enable i.MX AIPSTZ driver
Date: Tue, 11 Nov 2025 04:00:20 -0800
Message-ID: <20251111120022.696-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111120022.696-1-laurentiumihalcea111@gmail.com>
References: <20251111120022.696-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_040105_615915_FD56ACD5 
X-CRM114-Status: GOOD (  10.25  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Enable the i.MX AIPSTZ driver, which is used for i.MX8MP-based boards such
as NXP's IMX8MP-EVK.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8d6a1bb1e03e..2db7d000aca7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -271,6 +271,7 @@ CONFIG_GOOGLE_FIRMWARE=y
 CONFIG_GOOGLE_CBMEM=m
 CONFIG_GOOGLE_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
+CONFIG_IMX_AIPSTZ=m
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
-- 
2.43.0


