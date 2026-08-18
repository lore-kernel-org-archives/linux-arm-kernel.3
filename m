Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D39C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shnIdCEg5h/jv9ES3TNBugMx2+hKBHKqFcN0Zurfu98=; b=wyl0Db9LZZH6un7pioBfbYgtG5
	0fEYd+UungYYsWf7Y2tyd7y+6BaG85fZUKqN0+ihx5r7yQkpGsDJuigKK60aeWPTAklemNQqBv0dl
	CEGipBNjtTfXLoljDklGsRDLafQGWy0f6rm9Lt09jv/IzxVNm94rmx2WxWLQf7L+2k8tZCwZuUqrb
	R5CQ//9MTl1zSOhrPFzekmD89gylxgxArI48m0DNxyKDg1e5wFMXNNZlMJtMZrDDeAI3mQLXXKQf8
	ngnU+mtrSH4f1gjhCfAkCTcvJVX7B4qcBDS0mhYlF4zi7ft4C+sH0nsga2myEPlmulr7lHC9zquRX
	Zfnedo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6s-00000007ioz-08Rs;
	Tue, 18 Aug 2026 10:31:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6o-00000007im3-2gKY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:31:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso44437465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049113; x=1787653913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shnIdCEg5h/jv9ES3TNBugMx2+hKBHKqFcN0Zurfu98=;
        b=cXBLjHKy11NT4i848JOewNpwBaXEggvogt1RsrW9HKnc3Ng1VJrAka6whpdPn2HW+G
         UO2ZFK/elZY9VJEhX6AhPU8Cs4EnioDmldX9m6d5jic61eYP78CojLSOKJ8PMhcZU4S1
         RAfhH7MFwxf64R/Ut6ft+JvQQuVFd0b/+fwGiQNlusmeS4uz2cASD9ZAKToySTcLZex9
         Jcnn1trO+goBmkSCrltduJ6HQsWIBTT1o+Ilj+7K1qPZ8P2k1yeAlloJFuHP6U1WBwdG
         NvYfMCQpg3jo0UmQnk81rsA/s5vDs4NjHsN9qyveQVDTOsej84EUuCMR/7BVkwc1mSYR
         hIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049113; x=1787653913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shnIdCEg5h/jv9ES3TNBugMx2+hKBHKqFcN0Zurfu98=;
        b=WcOZcD336O7JfzuRKxB0B9sAj0Pth5+ezq+pLasXvLwfbpXqXgB9fZshXHjclyDDdZ
         N9zjuJYwvhIPiOAgVPh8B33ok0Q7lLRg2PvHWt8nhTlwdc+6mfbUtI+V3zWGZOFvz+p1
         zXIEl6NI7/L5uibOSUU78XJWzG7WmoH1QDCqnXWYqgk3+6GKTElYyxpTQlyXoGdZmdES
         dUecH5UaK5OIfwSvIQRfGvnhheN3x4q2qKiTnbES6wL10RKPhhw4yxGVH/u2wRGtRoCF
         ZosJVw80ye0W58gI7tz9vKlyaCSI/AtSd3fbQ0urHU/cbI5HYZKpwvTiK9RheI0HhF0n
         6IEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqq63UyC9XoQ8z4Dg0i1oYoeaoFmNbN+79+RWn25bYRQe1BXFwwLFFpyZRoe2fgZVUcyroHwxDxVnPOkQq/NqCo@lists.infradead.org
X-Gm-Message-State: AOJu0YyH24v+16D1EODhuFS3Ccfq52okgp1iTUef2Rz3PYnEpRaYXgp6
	bXL2iJ0vMyrjHAiry8sePT6XDXtS0b+4hfFgvFvKoKBQodh67gBZBedon1hrEZHso/0=
X-Gm-Gg: AR+sD127c6t7pGkA0dDNiO8ZbEVjV6bBaohXG7/Gq/74MPpz1ta8YDKLJDqn5PKXidW
	PMeJk74sTtBKZ58eVPyNOB6ErK/PrKygf3ojB5qnAOdpkqPxtU/MT1OyhwsBjZrWsmGTx0Dir8U
	ST1TXx2Nw3o+HyfW/WioCb0F9dozvp/V69L/kcv2bnP56eQHGQIa6MOP1GglBFWKuc8G8UpC3vS
	ZruwxmPxKIOZxGGWZiElBdbl0e6R4fH88cgouYfkqG/fMCaHqZ/IOYRRex1BB0HsVrnR/7mhvzo
	0zKBLCM6vqAmXKNPqw+W/XlhYQHHXqOYXUNpW3ajKPG+4QC7x0Nxnu4cKIc0pXy8WSo5wEM98qz
	AjgWevD6JMan/OMQKTa+UeB+RP8VmjmCxpNA3ChDQVAIMywXbpd7g1mmpp6gogrbs/1SMvegYS5
	LLaAv/lAl2gMRLRDY8J3RLQRhA5XCOkQ+Vskw92gUGg1zVjQFgfQGvbSYF6GR/5/XPbOVBC4vIm
	RmIJSjnnfZ0NtqSVFq/z6RT+V+/NmGNZjSTesrWzZ6aVuhSi9xsb1Jv2M2H
X-Received: by 2002:a05:600c:12d3:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49987980889mr317588565e9.10.1787049113006;
        Tue, 18 Aug 2026 03:31:53 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:52 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:19 +0000
Subject: [PATCH v6 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_033154_698689_AA52916E 
X-CRM114-Status: UNSURE (   9.72  )
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

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the scu-syscon phandle.

Added lines are compliant with dt-style strict mode

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index c952e2075b4c..61cdca0b3ed7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -723,6 +723,9 @@ vuart3: serial@1e787800 {
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
 				no-loopback-test;
+				aspeed,scu-syscon = <&syscon>;
+				aspeed,vuart-over-pci;
+
 				status = "disabled";
 			};
 
@@ -743,6 +746,9 @@ vuart4: serial@1e788800 {
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
 				no-loopback-test;
+				aspeed,scu-syscon = <&syscon>;
+				aspeed,vuart-over-pci;
+
 				status = "disabled";
 			};
 

-- 
2.54.0


