Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA5DC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEYndMHB+hzzoGm3/jN5rHUQhOLtVYWufPY6GQuzOfA=; b=0uiNP8WjabPBMj1fotz+GT6OPS
	V2IiTjNjLPxgq/AnM5YPBm0eZa30BnRMYYmWO1x+uKJNUaKGKh+9AgKKBBeBJnxZFDFjT3lAS88Sy
	SFJM33PMu2T6KpH7WqZOOk/YjNuNuqOyIAw3bPOd0vFyMMnBtMYTq8w3Z1Qn6i6kOqaZ9Zya3H4C6
	6N6Z5TcoMfSvfI7dKVUNnXbCDNAoI4buIFPgII+d54k7uVPLfcRzK4+3AJyY/NREgDqKuV9EdLagh
	IL1i/76ZihVEjioYHG26TfQbEm7UQA0tnmavzRwJJmxqD8OT4kcyHFrh2Mjktv4tQ5nnid1TTBmrj
	PKkoyygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG4w-00000007RHO-2s9k;
	Fri, 07 Aug 2026 08:37:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG4u-00000007RFl-00cE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jEYndMHB+hzzoGm3/jN5rHUQhOLtVYWufPY6GQuzOfA=; b=OxIUBaoBsb7rAubA8j0QnMthWp
	GsO8XTHiTXtR4U1R8LR9vVTTvVnzBaNyWE4eL2if3jAWfUK70r+KozbkEDjqhsikhyZEbikxTIkLN
	9UWvi6wtc5Gga1s6W86vpHBoii91I5Iy0VzTPIjQQ3+aMf4LIHN4r+pVn2o/GFIzUTpBGvnW0sDGj
	GO+1F44+KnfpPxpUg4aZobPcjvmwbzA0NFoNq1ok+pgSU5y+wTnDlCIcMEtw6SpcbGLfsx7xxFi01
	JDZvD2IOld8RnC74B6MuNkLGg1ij3baK3pHF3khA30LP5HsKzbEbKw+DSAehoBWaGws3S148QjUwY
	O4LWZFIw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsG4r-0000000CCrN-0pI1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:37:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49800c6a846so25433025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091835; x=1786696635; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jEYndMHB+hzzoGm3/jN5rHUQhOLtVYWufPY6GQuzOfA=;
        b=EjzazLE0iMHkFmKMWA3O9AmaVMu3IY1R3K5YXjLz6HBTeAhyowWSqe5cdDDL8IBSrB
         xRKhlcdlgLVCKmKB7rNE1A/yae7r+RfR/06E7T/vxFLCtnKYKJ+O0Oqd6UKmpHx9sg2Z
         2SgrLqOYaJo0d53szpOndPZhJwfJPwgYaQc861aA5uGyocNYhZBK/ihUYUJ7dp4DcUhZ
         oyR75WXsSWHegEXc6KFPx2abkvk8mWr7En0gJt6sZhMlHoQ0rDB+V8He/nYEySmClHBZ
         ccibw+1zIE750jujFd/iyNTVZOzB6SnnswudsnUG1KnRBw4vg0o2OquMjB/Rctxs2N9s
         2GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091835; x=1786696635;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEYndMHB+hzzoGm3/jN5rHUQhOLtVYWufPY6GQuzOfA=;
        b=RFj+LTSK3ku6sI++w1VGxuVQr26lYQn7nLbms3rc20AmI1fEOmPLVKO3ELqnPeo8S5
         T8qsU1KbkVAE5scym7T3JpE/G7CF66eZUvlDOpwGuTh94i2CsGY+0jJrhk7PUGgwfpQF
         8p3JXxD1+St3vlcg+ng7P8Kj3UMh0tVC3RHY9RPkQPxjxGIzE2YNQ4BOpepdWgJN6+w7
         IaoNKFR60U1zBWvXPmdZyIMkeOKMkB/eMBtWrrcMNjD7wZbqEAiijd47AkZC0rMCwscw
         qiTtHOq948BDj0qmutkb/hdWXIbGwxj8zulUGAhpDMWohN4cDhCViSraKNDckxwGcg5S
         JTdg==
X-Forwarded-Encrypted: i=1; AHgh+RrHUi7PWFJyaSLPTrGAfEuj36huXMJdAhyR5DyoFzrOTEZtecyIAfGlqK7q2fi7G4NzlZxfWPWCOCgF4bUdyR1y@lists.infradead.org
X-Gm-Message-State: AOJu0YyQjdSv+Tc+yFrHRV3uVEzVXjmtAbTs8mNASqpZG0SRvUe1VS4H
	kLQl8XEe+0MvHgIaJQGpr6tfu4DIIQZTUGt5TTQpZEWdOGgnVLISu8wrws1NOMg5PCI=
X-Gm-Gg: AR+sD11YptpvvgLWunMgy5dyVWROYxl2UfXQdHRYlOMnoaRBdfz+mtyNMO0mqm9/f8A
	m5fSNycoxsnHiT8wa7HtwUW/iaM7gVBBeP+CThKotfB0g+POZD2RlgMBdtVWFGkzc4uCb+cTLQY
	vYz497jjR+3EWiRIvpdDwRt75fHY6F/WRuMNbglZDXFWnL/gXiy9TIHWyfM4iGb8O2HqZTuhbKf
	xXBOs5HWO1BHDXwZWZtuQyAytbCRVkDleGnsU+bhg941tsqtYFqzxi/sK2A7gTASPnVa5+1hW0r
	pO3IqvQ19HY7PEig30hKOGJ3hDAOwhbs7l4oW4k19C+HaCSVxpaKC10ByP8U2C0UdCyy1LhoRrj
	vnCQT4hqOg+Ao8Fr6lISW25FDEn0wfiLT8xEd+uriXNTRrI6wLbh+HVRlR4sojFJWnKo/nxHWV4
	q44DJGuDtFsohu26u6R8kXylJm4b2oEgc/xUdhsQvJUluBhaE2aIFbkPoIMJGdWqJqnexW6Ac=
X-Received: by 2002:a05:600c:a47:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-49959e2eb00mr92663195e9.9.1786091835248;
        Fri, 07 Aug 2026 01:37:15 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:14 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 3/6] serial: 8250_aspeed_vuart: add VUART over PCI
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, tan.siewert@9elements.com, 
 linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <84efc6b23b79e901245e9ed7f58546bef6089530.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <84efc6b23b79e901245e9ed7f58546bef6089530.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182923.193353.14922851647951168548.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=504;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=P/41CvtTcGae/equIvztsQBGuXVGaJoauUSj4lEXoMo=;
 b=w8BqgggHC8+rKIIYkDpF4V+LQxQsLNTjAkqs8Mvxlj5omkapBkoZ7qOK3HWj+EyFPq5fEadKj
 1czd/NMPD8ADtaa6dibTAstN19JKAfgQvZMVKV0WiyJ9NIMbbW8jdIf
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093717_367261_4AECABC5 
X-CRM114-Status: UNSURE (   8.60  )
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

On Wed, 05 Aug 2026 14:19:50 +0200, Grégoire Layet <gregoire.layet@9elements.com> wrote:
> Enable the VUART over PCI for the AST2600. Activate it only if the
> 'aspeed,vuart-over-pci' property flag is set on an
> 'ast2600-vuart' compatible node.
> 
> The AST2600 has 2 VUART that are usable over PCI. These are already
> defined as the VUART3 and VUART4 in the 'aspeed-g6.dtsi'.
> 
> [...]

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>

