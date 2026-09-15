Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0B8C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bAgcAeT8h1GjhtSyhK4NU9n9kJiBEpb3mWf8LmEtbk=; b=0eTSaQSXHn2sJVgd4gm7sqjtU4
	MFvcfeuDnSHyWT5rTQvPzOnflWelc+TbyvNnGs5nNn9C0uynByI/VWAVYSr7lbAB9tjc+90tIs81v
	lEB3uqCfRZee42TrEH7HnMKGcRXiJdlAmTdUTlUQOjgJQWDr3s1wsv0TUCHGCl0oq6eQeoVYHLAKf
	4NwYtZKbmiEI64D2QpZpUWO2E89S4khH0yQvunlxsvFWCFJXTaFNbl8GvsNPfG8Q8ugKveg45yfN9
	bSs0vVJvxcy6Pnd3DhHYrgQzvkUR7LzoTdjaMgfRrT2dgYQjLXXD6SAS+tByniAajj3JA9J17TOE7
	gdHYZ8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Hqh-00000004wiB-2w0S;
	Tue, 15 Sep 2026 01:20:39 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HqX-00000004wfx-3eix
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:20:33 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfc6db0aso34581746d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 18:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435229; x=1790040029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bAgcAeT8h1GjhtSyhK4NU9n9kJiBEpb3mWf8LmEtbk=;
        b=Jfl6HO64zwaH9B89nDzURs9yPwEt6Vzc2vCsDprtLEXe8cEnMRCNQdq3vesD308nV0
         RL9bWV3TDtd7Q8cEHeyDNplFVcMFgIh4P9DynDmqs1XDOcHNyozrXmWi3ybzD0/A1krw
         kSVzxunXhfKBKFiBbHN5Sme4fkjJIz3RrCTYJH4q0SApPScYc08mzBjr8mda6tCem9Dw
         M9rOIKux5XUNmTGX/YOAe/TaRPTQzG4EjcWH20qdRzrmKqK57EFJNQ1u1009mTsse9cV
         2z63BcFOPkvgHgdRAHargYQK6vKu7nunliUFMO9TKWPSg3Pf+qyL0z8gd8c0ZI3tdT0N
         jiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435229; x=1790040029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bAgcAeT8h1GjhtSyhK4NU9n9kJiBEpb3mWf8LmEtbk=;
        b=E06wQGjsMjcNj5i8RVZobcxH3P/++bQ3b+9htlhblhDgijzfuoJbEJHWqsCigRGlyI
         D9dRN2Spn69qy3LEHEPCF3J79S82EwK5FyTPzyVLyjNfbiqYK9AIo8cJhqfxKbgA0gho
         CYxxb04cHZzA/oEuqP1MWqbfSrkjF5t7vAkBL5578lG+rr95SR/K+3c8CRx5UIM8A7MG
         oVTh+fqtYhz9ztahC6V2RDN/bfAL0yGj4jMsfRJc38kaUoPApP7VQg94hxochUOKoB6N
         oNRNn21vFUzfnzK+7ysNBq8VKn1cZ6hf3UBQOpH0ohY4GxDfMtKnzAuWl5PkQcfO/ipW
         bj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOBfVc9Y5e4mT2FEoxKFtgzoiyCAW0SLf6/8pMziQ1Qw3uhTpPL7aArBmr9NB5GELzEnh2jH6ugGWa42g3teIh@lists.infradead.org
X-Gm-Message-State: AFuF++lEXecXNsoAH/4InZYMQb24FcyCIgEcIllGS4t/x34UvR4Jt02i
	T2Bi3CkmDy3UetFUJRNRt76aonRvyJNpdHxNFuha47a2x1hi91qO59Y=
X-Gm-Gg: AYBFou0zOfxWNgBg3OOJPYOWwAhdgGDNjLkWDpty1D6eve3Jean+VWGw7OXzG2Tj46h
	EIEDgI0SdF8X0cbNuBRxaPPjKsO16g43ZlYHUjHxBP5MN6eIfzTTpuO7brxiimJT5rsOjk4kRPI
	djtuLN6n+P8qJ0qf3EPUMijxdPs6MYqIU0fvscI0iPvwMJQU8W8G2WJsbzkj6epQ23SQPNn4bJF
	wb90npa8HXUTjksBwlUx1P877Wf96VT7q5/1CKXmDe1zl2oHmzgtSeomjZrJeNe0ZuO+RjkqbEA
	VpbHGaPg79hBmAMfwiPLPO95FJ8WPOuVtmHrjEZ7JwiwGxMJCvPtaKpEDtVMRMwQBrdGXjDbtVj
	ppv7i4nHagv8mdUiga85jg7RhI6rhjdsXUJeVGgQhM1/yXyYoshjdrQHhCQfSqjTbGhdh4O4DPs
	kEd2JeOJcxMUlM2Eg2dFGvwa1rVmLqKP3hU/iJrB0rqsxvEnK2Ng8w2QgSB5d+5F+oAKjzDDrp5
	vJeWd4OTXNZpQtbEWZhs6BWuXAm27L9gqRdEiRqerP/uyF6MWwCzxIYZ+NWGSgilY8F4DnWUpuS
	NAQC3hWsip2rpbcSDLACmHSJGvvuz/2jwxQol2WC6zD1tLOTMWyn0Dn1NTbarWtc3BTHT/aC0xQ
	jWp+UTA==
X-Received: by 2002:a05:6214:2f0a:b0:910:3453:9011 with SMTP id 6a1803df08f44-9122e66e23bmr95006006d6.35.1789435224176;
        Mon, 14 Sep 2026 18:20:24 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:23 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/4] usb: ohci-s3c2410: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:09 -0400
Message-ID: <20260915012011.61874-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_182030_927008_63880584 
X-CRM114-Status: GOOD (  10.11  )
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

Probe enables controller wakeup after the OHCI core marks controllers with
RemoteWakeupConnected as wakeup-capable. Removal does not undo this, so the
wakeup source can remain attached after driver unbind.

Disable controller wakeup after removing the HCD.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-s3c2410.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -335,6 +335,7 @@
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	s3c2410_stop_hc(dev);
 	usb_put_hcd(hcd);
 }

