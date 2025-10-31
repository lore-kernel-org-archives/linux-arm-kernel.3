Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A5DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MqCRP9/Mbai8FOF4N9IAH1BiG9vM0x9aR5MB26eKXF8=; b=gw1cjwEYOkIl7qEysv7zKv7Wrh
	mLTt/hl23zDYwBf4xsfFpxD6/q0KIpJzQbCmWV5PNYjvss4t/0o53UM8S0yMQpQzE4W0YtXpqjr1r
	V3Meva6UseysoxAndnLlD582LIOb/oEZYZsit6pxu9v5pRA++Xk++E/0P7y8p95BVSDoEbtUbCp4R
	cjFG7HC5ahYWKKvLt+w4dU2m+iGOe0E+ilCIfE4vSKdALwBwNmx2wcGpD3Xmn2T3c4as4qUvcw93U
	TIgv3i1uHyr5c9+BA9AuogxiCnfIvMRokykhF1e1SAzd/fQqhoXo6mHdmVKyAJChpM7PsACQGeGvn
	jnX4IRXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpWq-00000006B5r-3sfk;
	Fri, 31 Oct 2025 13:50:56 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpWo-00000006B5S-0Qlj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 13:50:55 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-63e484f8e54so476329a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761918652; x=1762523452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqCRP9/Mbai8FOF4N9IAH1BiG9vM0x9aR5MB26eKXF8=;
        b=UYJlHkk0u1mQPJRk6AagBf1M2D/sJkFQYrtoONbpLXJ9MHOEjaJzKLVGlh3NNUcHgl
         2xEkvT+q1HooJbhA8aZHKhe/vKPal7XC7B1setLoDHMgOeC4WWMSHc361vy+1H+d6dXq
         ObwhZHQkdoYvH5eQh1ulhp6LOB1oYpYUmXbJc1uDrDnb7aOc3UrCQrL+H3dqeqBTIjUY
         /0wowwwOPWxWvddz2bJGtP+8XgxsCWDCG9FtxV6KRzjV2i5EQiqlZqqkVMJMLDHxNjZS
         KXT4j2szzMqKtxMnnDo5W5VFpFuoHi53poWapZfZMCdAvyQh4O0d4GHa/4q23plAQ6US
         qSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918652; x=1762523452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqCRP9/Mbai8FOF4N9IAH1BiG9vM0x9aR5MB26eKXF8=;
        b=szUyUqY8aOFhOsRmK6gl3CiVHaijgrUzErZ/UibxRug93lY5kUmVeAn9pdoFehBEzs
         aOvPEPjhKCyTI9hSMqYk8o4mcBwctaZuz/o1uEAvUjZ8NV0XXub2V2WAGoymh+/5VgiE
         mt3J5ng2o1pSZTnV8t5mj0YzFR4VekBgiJ8JHpT9ISaMnF1fYaqvwiuvk5OeEcx1vhas
         egNT30E1OXowYW6Hm+T4iv9p8d6MoVD58JIq75meBhLYcfM+n/3iTYmoS6x5B7cIDjGK
         BAhSyb3ZKmwfgsLal7rt2yHQ2Wfla62Sy/6uQoqtsIB8Jrg88+z8kzGfgybulqpNtLzB
         6VKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV18g/c2nvJ7nY5i754vIS99FS7uGRyQelUtKJz5pn8LuR1LVHgwoKv2mQOgS5UAj1ui5VLFBUQJb2C2jqtPanm@lists.infradead.org
X-Gm-Message-State: AOJu0YwzhNPuW2EEiSNf81KObOdNuc9CAqBWPRMW5JaD+3wblmTnyOjr
	RZPKa+YQQDGZAo0GAQtGU1q5sYiKZ6inGnd3pGqEDunj7klsrE4HX+kglmnxvHNtNp4=
X-Gm-Gg: ASbGncsxu8Zueztv3PJYPLtkEvOCQiOXCDscS6oAOMl1jqY3zQ8Ph38u2yMaW/+1c8c
	cECnDw+K0D43wFl9Qc4dDXDR3Zz4oPcVvaQlEGlYWgNICqrZjxqScY0J7NJkigW7jpiYZNhuVdg
	KNFAD4JaS0i5DA7dW8RfmKQtZWoeyNgvt7KeWElDUtBClY4q37XWtnrjSMlQLSmZQMpVTpC73yA
	cm72nFhHk/AyfbsrMOHEd4zQY7CDYXgOj02YhINIes45qJyEAWKm0zmc9WVrxOzoFTqvpjgUQ7A
	+uanepW1fmlRQeCyIqtZZRxmpFGel5N7jHYGmfhIDGgbKau6Lklog5Rq12E/2pss4FI01PjxlvD
	QOMCAxcI+j3VPbgHOEwQwfsOKOkPy2a7UvQD1BhAOVc82f0u83nIByJCkbAuGKLZQNNA+rvUKNe
	nH+ChI4w4Qnr4=
X-Google-Smtp-Source: AGHT+IG4ALcuZ2ZkrRAVrLeUPvJuTLghF2aRSPyjEkOrlsMOO2oZQiqthEsk9HuFzyEGo/NHGSB7Vw==
X-Received: by 2002:a05:6402:2812:b0:637:e5dd:ef81 with SMTP id 4fb4d7f45d1cf-640770412e2mr1525778a12.8.1761918652041;
        Fri, 31 Oct 2025 06:50:52 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b438ca4sm1647724a12.29.2025.10.31.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:50:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH fixes] MAINTAINERS: Update Krzysztof Kozlowski's email
Date: Fri, 31 Oct 2025 14:50:39 +0100
Message-ID: <20251031135041.78789-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=SmfR1ZQDKDR/gPIplrtS+9dHdS1dhkdiyMyQwkEDbCI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpBL6xj/1/uZGgWmRCMjhesc0s7ijjyTpdGyik9
 o3dmzeDDMCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQS+sQAKCRDBN2bmhouD
 10xWD/0VNvesF6NpXo8GEMwtCDZGsmu1Ez1bxfGh4Wcx8onnFQYnJNNM0nZS4Wra8wGmIXEs2yw
 ++O7yRYY32m3kWy7wl1tJONc8eJPqu77N1N1J0jeXL4Cz8FHBNH31WAsiSIVY+apYXuoOxs42dP
 kOzCCOelWYKPetbG0HTVRPbUFz4woOj0T4iP7DHfedmRhvm/8hyEnMNlOLa03C5ui0vSu+b/tBw
 Z9qHcDlE+VzHsmLdEPH9Xlin29uUzxZHrbUfEZMJU/TKfF+Zkwch+U1LP9hm+6ba0ac9RWRD9NA
 aqa7RJMb9S4Z3gDXjntdUxKqOwhj/GJaRlfbtR3tkBo5fCwDA3/qDEg49bIefrWNoIddZAC8VLI
 +Gs8ExA/Wfsg/INK6QdWmSK+MHsaVW4o7MMnt5112zF691VElnAGnu1ALJryqz3IDqvy9juiYXr
 kRrKPAt9w6gQ8PTEj5yr2hV1SRIc5PFxNbO+txUTBigl0D4Q0TVxNCJYOh5kSMQCB6/Ly7fF4Qh
 tDKuudpRKh4mic+mjJ/9K+j8+PlO1KszRubCHAMKbfOZ1T0iLvjK42x66Zw2Og3puPRWwAN9x52
 JoK8EpG7tYRyyWk9lpcG8I44Puhr/v/k/8cmmzeuc1m17fRq8s6uOXfcdah9P+nX3W9/b1dsbhv iBSYSdgq8bvnv0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_065054_206731_F04A4275 
X-CRM114-Status: GOOD (  11.05  )
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

Update Krzysztof Kozlowski's email address in mailmap to stay reachable.

Link: https://patch.msgid.link/20251021095426.86549-2-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Patch for current cycle please.

 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index d2edd256b19d..9811c2a979cf 100644
--- a/.mailmap
+++ b/.mailmap
@@ -435,6 +435,7 @@ Krishna Manikandan <quic_mkrishn@quicinc.com> <mkrishn@codeaurora.org>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
 Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@canonical.com>
+Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@linaro.org>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <krzysztof.wilczynski@linux.com>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <kw@linux.com>
 Kshitiz Godara <quic_kgodara@quicinc.com> <kgodara@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..811a89d61b87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16186,7 +16186,7 @@ MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-B:	mailto:krzysztof.kozlowski@linaro.org
+B:	mailto:krzk@kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
 F:	Documentation/devicetree/bindings/memory-controllers/
 F:	drivers/memory/
@@ -21148,7 +21148,7 @@ F:	Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
 F:	drivers/i2c/busses/i2c-qcom-cci.c
 
 QUALCOMM INTERCONNECT BWMON DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
-- 
2.48.1


