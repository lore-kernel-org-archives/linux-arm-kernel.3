Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF37CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ic1RSwaMXXzlWjrwYqAcZq1BU5xUJqmqIIBPYXlasM=; b=ZMxUBvjUkmFR+YRdPPxb4dwzIx
	RgOXoH1L9E0zSTyWx0cvq/Mn/V3slUi7wt1LRkr8QukQonDFcTns4IbhyNclMOxIUVQ0bpgxQZhfY
	ItXP97p6wIsorTA0IUmt3pf0Rbxg1M/wmtgi2AOsKAsijoRMFfWLVfF6sOsrxcbVWFwjtiGr3JZ9n
	Y5/NHvIZLL+/u1WtEcC1a6+eu7nhOvcFf3OYSfwzjOiBnQwvsmV539UiTDvuTvIavFJIfNspiiLlO
	s6OwaJh+5RRESsz4Q1snslqq3qpYoSHZh7HEDrxkzK0wkVLG2hqz+k7qUKZG6b2CuEejGnuzJSRB7
	8rJ6kGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyK-00000002Ulk-3BQz;
	Fri, 22 Aug 2025 12:34:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIoV-00000001RlM-1QVJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 03:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2ic1RSwaMXXzlWjrwYqAcZq1BU5xUJqmqIIBPYXlasM=; b=oTnxe+yDPZQa8ly7Yx9gu1qV/E
	YkyhOkaSIjwc8xubapW++x3e4Im7QaTJtXmitAKTE/wCl/bFKz0t80gLXDeFSWuT0swjgj8M5yQbM
	ou1iNnihZVG/ROqLcObw23j97dN5A/gTpuNzZ3PlvprbqlkCRTXM/lsGzy6DpJx45rLmuuihDwW3s
	vk85x+4s1yMCPsOTY3yE/EkDD1Pco3JPldzu20MAU6FfyJQ8TA/jL09y5vsJGwllxyQ96J1RV+MvI
	xBonugzhprQa7gaBWy9bmxbv89cGzQD5dHUADa3/M8puZEOqbnBZfwb5GOCFclJ9uMxI6Nhm5WHFD
	UZC5/Sdg==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIoN-00000000nbS-46xp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:51:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-323267b7dfcso1601052a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834690; x=1756439490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ic1RSwaMXXzlWjrwYqAcZq1BU5xUJqmqIIBPYXlasM=;
        b=ZTJqo6OKFF09WhQA1Sv6O+EZ/eaPpz338cM49qt7H4faNE4KBw+ydrPzGPEsVg8GwN
         LlRFgyTvoCqCq8xZ59v9lQsM+WgTP9hJyQnn2gcw1dQO4qdYpXKK/96mk89w4VCU5SaK
         S3jWbikMDGtoPLAhi4COnF6aj0XbTt9NAI2+ugexGo550LHzTt67G4bvSum/ibl3AVBq
         Io4rr4joVUL+9wRKRY+MDU0vwCgrPLA0DSC9z+6cGzP2E60b9deQDezfr/k0TxxZcWAM
         8l1BdwSkJuhTfL6sgT6YRu7xn/4OFphJ8B3Ncu2x/zBnHZPUeMC2Un11T4RZ0LTr8HZH
         uVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834690; x=1756439490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ic1RSwaMXXzlWjrwYqAcZq1BU5xUJqmqIIBPYXlasM=;
        b=BkiWKexi3mEchq3rpmxdf0FTlpIJ779c82Wid/BXxy0qrDyK97oXbGEYNy2YPeessK
         SA3oV6RwGHOPkqSfxjN/muGQlRInkitHRgqAqz4zFwy46wLxc5T9gJyjIBxh63DB4hqg
         5u9iCyBcqLUOXhPC2wlg8MzyxTEbi6WzR12Peer8piztLVMWe83zY0KaQL8+w5ECaxue
         a9HMENOEAYeAUh+cgtTEntMAV/cQb4trF81XfeHmBnwNIW27qoNAhvjXllD/4kT5nYfN
         JuZZ+nfPZFj1MXTNK7DqAJ17WP6I94on07R9ttkHwzllcnJ5xwDFPYY/XD13LS9NjhY9
         2v/w==
X-Forwarded-Encrypted: i=1; AJvYcCWwNxu8oiZS/07PwRQWFWuYXvDnHJtQc1SxJM3w40NAOsmmRAFLNnlLHLLXTHAsQDMN/virQFNIffDLVJSm6Cg1@lists.infradead.org
X-Gm-Message-State: AOJu0YzifuOCsyu3xqQwYGaVrkXYBWIYfBInTFE6F4Qqzy+tE56E9Yud
	A7r63pPF5apgXNYkulzmEIbNyMcr0LOMauSUk8lQfW5jl4Q1Ut0hdmqP
X-Gm-Gg: ASbGnctKmETqwxkYJL9+BeAijNt2G7zjmjMS+sozVxyqkLKO9UHP6wHhkVSpAp4j3ji
	ke8ML91i29Z4YViFXHX1EYB+hJHSQunJ/c5OWplkGCrJl26lzigMceqgj5wCYgopmJRITvAqNvQ
	Vk9Scco8USgVfaBcluzoTwqPfW5ZBxyYIqORwzj0noCSJ2QPLNfr9wjCVxhC4V32PNCG67uNpwg
	lu70wKiAKbT8rNbXMHlmJILZlXgCKXwyj70rX38MDg60aGsm1txf0DWw/CAlcSAF8Ui8vYUXExO
	D9/rTRLH0vUiAqfCuWXRYBr10NM5f7E6+YcctS11AqABVjYUIvkbQT/K7m9itz5Cz6+WMVbB1Xi
	kTsz0zFWUr7sqRbIXuzHieHKHhjRJ
X-Google-Smtp-Source: AGHT+IHazmWMn5flz3tUaLeTbaWTObNzUqMBMWJOszgRw6Z/ukldWbaL+PRp8cadzUHNkyL/sZ9JwA==
X-Received: by 2002:a17:90b:3905:b0:323:7e80:881a with SMTP id 98e67ed59e1d1-32518b82606mr2312355a91.37.1755834689799;
        Thu, 21 Aug 2025 20:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:29 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:55 +0530
Subject: [PATCH 07/10] iio: potentiostat: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-7-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Dixit Parmar <dixitparmar19@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=902;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=E1V6sSqy5U5ix2vZ9xw2GcRNF44acNubcMe6cIl813U=;
 b=aWuPdlGcfJX5HdaU6dQ4HYX84kcudR6WWXh2AU7VNH88OlFqJsDl+0zRF36EXeUVuuUYIi8ni
 WpnWGOqUnKCBWTnDisswIM4TkMfukTERrC0n2E6vcvNG0UpfSGUKNEb
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_045134_260787_1AD3C337 
X-CRM114-Status: GOOD (  11.70  )
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

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/potentiostat/lmp91000.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/potentiostat/lmp91000.c b/drivers/iio/potentiostat/lmp91000.c
index 030498d0b763..eccc2a34358f 100644
--- a/drivers/iio/potentiostat/lmp91000.c
+++ b/drivers/iio/potentiostat/lmp91000.c
@@ -321,10 +321,8 @@ static int lmp91000_probe(struct i2c_client *client)
 	data->trig = devm_iio_trigger_alloc(dev, "%s-mux%d",
 					    indio_dev->name,
 					    iio_device_id(indio_dev));
-	if (!data->trig) {
-		dev_err(dev, "cannot allocate iio trigger.\n");
+	if (!data->trig)
 		return -ENOMEM;
-	}
 
 	init_completion(&data->completion);
 

-- 
2.43.0


