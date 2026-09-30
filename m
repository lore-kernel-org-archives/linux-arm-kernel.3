Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242BACA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zhvlpv/etnxxE1xo+vE8I3wMg7dBPdkR6wAnk76hoag=; b=jydh4N6XH8KRVZTRv514DqOHh2
	ka3PHd+ZXGdvWe73lc+rqGDiZLPgEOC2j5wXttv27I0Qw3RFY8O+8PK/wErpoEC5KtmA4CrSJUEi2
	5+D5HAhV55yN3CgUlpeojeCDUGQoKanuexaeiT2GU2lDgHtkYmsiCZhJYfm/WBRnfyS0TH0EY0DW+
	dI83YQ4ZaB4y+Pimf6JCndgGpua4wRCWW6eHXe+bVrBqGDdE/fg3TOlOtD2GJvezC3eodfCTEL84r
	Qy+DwGmW288B/80dWjGItEAG7NXOUe5iQHzXxWUKowI4SNiwhhgYwOXYqWzXZ9ltF8UGezypmx5zu
	NujHmo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqeG-00000005ZQs-34uq;
	Wed, 30 Sep 2026 09:30:48 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqe6-00000005ZMh-1fGv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:30:39 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acb88abebdso1983303a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760636; x=1791365436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zhvlpv/etnxxE1xo+vE8I3wMg7dBPdkR6wAnk76hoag=;
        b=gZ6LUAsAsQdGTlVlGOZ1QIZPPizbD1cNN+Q5DAIUyp3TGHcceXyQtamcikolooDm0n
         t0XIER/u0wTLAXT99h32LqRmlLCZu5+saHVYTDX1r5TPe8spWD9WTg5NoahCMblr0xgu
         taBkuFr7M1B2VxeHtSsE7i+38UowJxZCegAdK7yZT8y4fAQwnPUAooHKiahNPoNC2zLy
         o5RT0s0nKCM1xvDO13RJRG0JszYed/3s/QSV5TfzxJdG1RcSrT0LCFnfAC+WXAkpsZqg
         yM/Ejcm4GjcXJfNMok3pOqxjE1RAlMnE2AWmjXkqXENJzDKGU+lTq5We23HszNi/zI+B
         0ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760636; x=1791365436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zhvlpv/etnxxE1xo+vE8I3wMg7dBPdkR6wAnk76hoag=;
        b=kuPcgOfnDDYw7LDZ71ZfmhgjxMYheuG9FEHucse1ZMwXLrUHmZdM/ZJtNGSx+tSbXC
         JSkxateKrOkvhD02LzKknZVVyJif2KMsFqhd+HpXz92kdHbOv5T7GdbgLoiqv1u7dDFf
         ulbk7D+lcZ8fr12re7ClI5eWaeVDBOTQre34Uu2TPgyAwv3HLTVW1bdpYq2g1Pr8bm6v
         glc/2OsclUuB3fiRqGb0krvucyBT/t5VQTMr6RIXBJilpnCmHNcdftpbk7S12RyjpEjd
         GVh9tC1h1/5vZSQR/dhOLZHl62504+2QVoxXHFEXWqlEkWd3sQeos7h3h8VPBOqHIXiA
         R7Sw==
X-Forwarded-Encrypted: i=1; AKwUvBxj7bE27XAXQH4SeAFv+2kPGbsOhKzjixfHsnnu3XzyVVy8FRPDD5ciqrvTZJOMYM95L8vSkBbzCj0K5fFPwMnj@lists.infradead.org
X-Gm-Message-State: AFq9FYKS43J9zeL+i6SHrIaO+6ZUReFb3VcjpkS3FX7dchOYe2BMdjiX
	WZPKDDloSdbRZK2G4dMy7riBGSbAeGv0MOdAd/j1WFHxNMe9T/diNSoP
X-Gm-Gg: AYBFou3CAao6hAAgl21FMrrPMgZXUeVc7+tUl6jrMwnBdC10vCBOuXw3oqysqkXvNJp
	TW1uOn4m6gumX4c8mH8MrIrfEpo7sVDM7kdHfzLcPFYP0oY9rp4p6TKDbrkGPx3QjVrsPudy9bt
	I8BJRGlWS5PM4oksZpOR3m5Dr72YcObMFzULd/LI08vL7Nh+aoT9I6VVY7Egnyxq8FLqf2rqxas
	tVb+ux5GlSllfi7vbIqLs/nQ8k4bf8FslsdDwXqzFFWBtqe5YyF/YB74jyOgyPQ5r3CQ6iLLekj
	ur5eLxDu0CFA9FcKkVtWReoWy6X15WKMhahJKHTKgwB4RnhxmlaN+BtIGopQ9hyoq08lHQw5viY
	NRMBUVUpvoqMzz1RT6pGlZeqV0ZbYUjq6OtSzzRefvXLi6K3dp3nwwk0uTvFCB47ciDAqNqvhRV
	lPEXm5mEzmgx1rHDoQ8981IpkJanpPxbb1bc4Q3MyCC113E+UyZbsTfXPVjWn1AWqOeXG3uWEGG
	rThf5C/KhY=
X-Received: by 2002:a05:6402:27d0:b0:6ac:68a3:3c30 with SMTP id 4fb4d7f45d1cf-6ae1992b71dmr568888a12.14.1790760636516;
        Wed, 30 Sep 2026 02:30:36 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:36 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Wed, 30 Sep 2026 14:29:04 +0500
Subject: [PATCH 1/4] dt-bindings: arm: rockchip: add Forlinx FET3568-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ok3568-c-v1-1-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
In-Reply-To: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=1111;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=jBOWfAe/37a+DtWsY4pcfCQdJQrauO++5rYgJh/u5TQ=;
 b=S0YR/mEpWlrZhLop51WlR9UQ85qM7F+MHMXdP7xV2ma/HTK6GtzwTTt6llNqEnCLT+cEvMpYG
 44HTadK8PWmDm3OWjTt7yWUx1aR1NxHfxb7wmEM91MYmPejst8jsK+H
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_023038_480782_6A76AA3B 
X-CRM114-Status: UNSURE (   9.76  )
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

FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
This SoM used by OK3568-C Board.

FET3568-C features:
- Rockchip RK3568
- DDR4 1/2/4/8 GB
- eMMC 8/16/32/64 GB
- RK809 PMIC

Add devicetree binding for Forlinx FET3568-C SoM.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..30a6794861cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -324,6 +324,13 @@ properties:
           - const: firefly,rk3568-roc-pc
           - const: rockchip,rk3568
 
+      - description: Forlinx FET3568-C SoM
+        items:
+          - enum:
+              - forlinx,ok3568-c
+          - const: forlinx,fet3568-c
+          - const: rockchip,rk3568
+
       - description: Forlinx FET3588-C SoM
         items:
           - enum:

-- 
2.55.0


