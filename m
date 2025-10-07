Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3127ACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 15:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9iDWqoWfueHqY1DQn3UROh93hmAu+K7Xh14JdQEHAgE=; b=143ab/RYR8fdh7gOQ69ff4iWge
	YqiCA0z9odU59Rx2YC7GlN0GeEp9gtgeWJZ15jmrOTqc8vKD5m/wMC+bVw71LdlbzCyuw7peb2OVQ
	4u+IDillOBGPGb78seQUIKGXTDLrLvsS0BmL2gfYX0s5mWcFAFY1gzPQahaDXyko+CGfEMV12q8Kz
	t7AmpPn1+WExXZgeOTpPhxsmYb7HqBH2wr0+3fJGLPFfXaxP9RXuiQo+4zDqUJix/ZXCEdszQpmG2
	g0lJmJa72au2jVKUS7vUdp9YR9p7ir1zG0PVKNKbnU1edChKoNMq7q6eHX4Tz95zGUh7AsnragE/Q
	QbVsaP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6A3F-00000002Kxe-0ezH;
	Tue, 07 Oct 2025 15:56:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6A3D-00000002KxG-0tlR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 15:56:32 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so1202478566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759852589; x=1760457389; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9iDWqoWfueHqY1DQn3UROh93hmAu+K7Xh14JdQEHAgE=;
        b=kSuvQIt1dPIh5CbiT0i5ysu7xFXldQ9UDZZMWNjxESS+ijLFeXLH4IzRe2rhkHCCCg
         Rxs/5jOA1ZKiTH7nR5V2pj7Q4HjihwztMLlp0XooAOlES/lc0bs21+mYJ0+A82Mj2BAI
         h35QW7+TFkhCv3OiZNytez0IqrMlcnwOsXoIRtE19MBNluLnV2Nzs8LEjHENTYpJ4AP/
         232RIr6uaSyb9vFmUZyhCPkU3o3sqKV/PSLdaM4vVpg+sUxqT4iBufluDSBzjS8ub3JJ
         vM/71+sgqYbVJkPAVZZsjQ2g8+UpaYNCEv5lpUm7gpyTLkdjn2SZaN3hhhru4coby9Ed
         0uxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852589; x=1760457389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iDWqoWfueHqY1DQn3UROh93hmAu+K7Xh14JdQEHAgE=;
        b=PrbJOFdqIsDqS0GaEh1HzPdY6lKLbWvDzeQz4y55Vd/FvpGLYdIWypS1fUwlYokVg4
         4aofcXGr9JsaqGBqyH88Op0QdSwqiSrFEDHhrgJ+AoXiJjh2ZCiOUcO4n/OFmQAnFUAd
         I8Q/fT4fBD0IQasos9JMNSpjkfaj4OFqyi2m9Z0vR4JlO4fOPwzKdoxlv5u0AZxxX8pL
         Gt1KIvJY1MtlmPGvCwGKJfLLnVU2i6nghZ7TAfXgW0Evv2P6QDYJZsk4cO4qx2qp6SRz
         2PTPln1yGZ1FsMjn9aINElTye1rYhnA3lemHVWxaFdcGlicro6cB9tHXNBV3V0wHB8gv
         nevQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqtjojOlPPmUAH9aUWbeghbC1/Oe7EuAdU28VXcik+jXQE5cpsStfvHVk9LrF7rKFd7Gx+NBTT9kqKOGfqcN/T@lists.infradead.org
X-Gm-Message-State: AOJu0YyFy54IbdO+WYk592+xxe5s1XFjoYVFZhxWWZrn08p/yVWBR+pC
	YkpUISf7Ca7QRESsAY+2QvIAYxs6qI7lgrRGKmAGnq058dOymzyjHj7WXYdPDVqNtTk=
X-Gm-Gg: ASbGnctT/9N0CwjOymBOzUloKjd3VWzQPrBnedouz/t6gGjc29ahKe327iisyHnmbfU
	fNBAp41Oc1TWHODbnTSiofvX9unhyZHbGGOFk3bmdv4PWV+8qiYnRVeHqoL4wv58Ow/kBkNi08p
	Rm2wqDOoPMPUq01FpdDblJRKz+NLGu3ykBPLPhbba4PgE3Y1ZCcaHEudW2F2/FQ+c91afi+hPSP
	A/skSYQOaNbgCyHQ3wz7W2OtNG5LWuTKJCwhzu0iB9fvfT0lU/JFrd83iXEbqvrdEhlqFAr49bJ
	pnXomwe7xI0Eouv80S6mhTGThp2nfZOfj9TCtKbRcOIwrzv1ob8YNso8UTNXnLFfu4derR6YMbW
	v50zT/CpRLYt/fZQMUrVO+1uovNex5WKdQdsCgizLY+TdABSBfPUiTg0VRgpw8IP3uDxjEcosfM
	5F3XiL3vl6guH7n7yoe9m8oZCSb8M2Y/ENvmB9E2H9
X-Google-Smtp-Source: AGHT+IE9IcJVSPedWcpAGpdnmJW4z9APNCOE9dq2vD2s6GXK/hxjPEw6IveEriVdGAIUqOpPhoFZSg==
X-Received: by 2002:a17:907:934a:b0:b48:730:dbb3 with SMTP id a640c23a62f3a-b50ac1cc3eemr13165366b.32.1759852589395;
        Tue, 07 Oct 2025 08:56:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a5dsm1428820166b.85.2025.10.07.08.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:56:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 07 Oct 2025 16:56:28 +0100
Subject: [PATCH] scsi: ufs: dt-bindings: exynos: add power-domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-power-domains-scsi-ufs-dt-bindings-exynos-v1-1-1acfa81a887a@linaro.org>
X-B4-Tracking: v=1; b=H4sIACs45WgC/x3NPQ6DMAxA4asgz7UUoBVVr4I6kNihHuqgmF8h7
 t6o47e8d4JxFjZ4VSdkXsUkaUF9qyB8Bh0ZhYqhcc2jdq7DKW2ckdJ3EDW0YIJLNKQZvSiJjoa
 8H5oMnx21HLxv491D6U2Zo+z/V/++rh/PMByuewAAAA==
X-Change-ID: 20251007-power-domains-scsi-ufs-dt-bindings-exynos-87d3ecbb3f4b
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_085631_271480_E5DCD84A 
X-CRM114-Status: UNSURE (   9.36  )
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

The UFS controller can be part of a power domain, so we need to allow
the relevant property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index b4e744ebffd10aa237e01a675039f173e29c888a..a7eb7ad85a94e588473eab896e48934cd5f72313 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -61,6 +61,9 @@ properties:
   phy-names:
     const: ufs-phy
 
+  power-domains:
+    maxItems: 1
+
   samsung,sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-scsi-ufs-dt-bindings-exynos-87d3ecbb3f4b

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


