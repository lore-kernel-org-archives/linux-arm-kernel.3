Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAEDD1D48A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siOywqRVhauF6+2pNczXHVdhiBY3N5/g/CIcxw4d/Ec=; b=gOBSl3u52xDq9FNLQVYHPoI5rv
	OqVT0N0mV9d6UH1DqwEChGE5bpHgzARDZBrUIyMIT0MB32PSbZG7OaSy5icLvcjWNOHcQMukkKgBa
	YU7c6dim3SLO7TdvqtjWMLDvZF1F62qKkPfgc03C0RSE5OQ/a1mC9L9e62+HOnCxtNlm68kL9qgxg
	lk6eidE3k0RFzKOEm8sGr+MnOile1rIyoM/PQxXS2nCEgKO2etPDILVeNhJ1MdFMbem2G1plTftch
	n5HnJ059u4mmWggFevQQAXys9X/jiQh+lUScjeno+n/nv+jsHtYSKeQ2OUsi8sxF3GxUzqHXf0Kat
	TrwGWnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxOj-00000000sxc-0V0O;
	Thu, 08 Jan 2026 21:18:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxOd-00000000stD-1zIZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siOywqRVhauF6+2pNczXHVdhiBY3N5/g/CIcxw4d/Ec=;
	b=awMM0I5BqrpLooSDai84+yvNaOytJGE7Lb+dGAEUFrSjhjfbJLUJSnKkZeVe2XAzDks7Ni
	dAnkirMwaIEkPauUUAKPz9IBkxStMfuB2UBQi0Xsz1nmfYwU8tfABDsZWry7+V6c7hgX6/
	3uZ90fml8XhQhkD4D8F9ajuQJhV65nA=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-1ZedsfK9NJq20VKc3xRjnw-1; Thu, 08 Jan 2026 16:18:16 -0500
X-MC-Unique: 1ZedsfK9NJq20VKc3xRjnw-1
X-Mimecast-MFC-AGG-ID: 1ZedsfK9NJq20VKc3xRjnw_1767907096
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9438158a15bso3740467241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907096; x=1768511896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=siOywqRVhauF6+2pNczXHVdhiBY3N5/g/CIcxw4d/Ec=;
        b=jAWjTs4CkWo1hn504uvarYfv02XD54+fP5x22B6D4AJRhuBUgrSivHTAqBY6BJKFyq
         CB375UXq35Wj4at4dPqJ0Ti+qi4Nai1yeEeczVIUHsCLUUW4emdDZiEtGL8hf78l7gfd
         fW5peRVqrFWMYobFmDMbfnBZAjVgxLZxXJIiB/i2EPAMvTcSlm/qlfEtUpFjYIK3w14I
         wG83Cmc4/GYIYuuCaSvawdoW4CCuz3h6urFM5TBzLV4VbcdWRrB0VTPi52Rxf/aIvwXT
         B9xzomCsPSKVU4O+dcKjNZGrfVYSIzbkR/CUHIPxNCz1t68YIksDb+PnX8URu807L2C2
         ZYhw==
X-Forwarded-Encrypted: i=1; AJvYcCV6qlMTZdIOsxLbmI3+MU0eGm+czoIFB9VT6/veBlx43V/xsWkotED6K9dj+fiH6RMOQW9M0xg6d//m+Z3c1SSq@lists.infradead.org
X-Gm-Message-State: AOJu0YzfhslS+QguRaIZvMU9WFdaA3qoprDvrYIxKqEAXcFEhnmYfXun
	j2EIntN4s158PsCO1NLKi/ExFxDXzmYHVAWD4uQdEO5OZ4Kq8tSn5OCNSck38K79b9xmSTZfcWX
	fpR9uZp7/WD27z4+zNFykF5H0+iFW5bGifyTCfC9RuRQaABUbVomH35JTmqpgBZAn+Ax2cd3kr7
	GuVIjM9Lmv
X-Gm-Gg: AY/fxX5as7VTI9da02BP1jt/RDsni6Tbog3EAqbrSONyhAzfnog8PeCpQW9MhNjLUXA
	mWhVnaSLQyCcnZtB4uf+3VUQYIlzfrUOdONW0OgPgWOQt9sS42ITufoU9LkJVcgMgjnfuZcJRnY
	VjlO2rXeBvF2ikIW3FoS+WENKLzYuSpJKi7FRsn0aB9TmGqEX7na2ypTl6/CceELIwqrsck6izd
	I7oOaNRCHl8mRKNvqenaDv0FvdulrpTuonqQVMgEdHcylWDMgbhmQBPz0qw216P+qiFVr1ZmXBK
	ufuOvYCbRe8zdAnD/+U5J1OmAIknZzJ96E4dN5uSEK6Nsmgy+46rQYMcxPEeIyDAMmcN4WK82nF
	l1uJLzbRgcciU0zQ=
X-Received: by 2002:a05:6102:2b90:b0:5db:ebb4:fde3 with SMTP id ada2fe7eead31-5ecb6875afamr3022767137.16.1767907094751;
        Thu, 08 Jan 2026 13:18:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7pmFryhw0KW5QeCDQ/EVRIv8eiyPnJcDCTHIYHaP0Lu8xIO3tTA2mJwSeqtxfokatvgQWw==
X-Received: by 2002:a05:6102:2b90:b0:5db:ebb4:fde3 with SMTP id ada2fe7eead31-5ecb6875afamr3022759137.16.1767907094229;
        Thu, 08 Jan 2026 13:18:14 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:13 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:31 -0500
Subject: [PATCH 13/27] clk: nxp: lpc32xx: convert from divider_round_rate()
 to divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-13-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7HOzNeGSRizgZeFkVaCLBp3lcLY0zAl5xQHRspPP9B8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HZ4Cx5blLbRy2D+HbH0rDTjV57vL/nFHeNb/8hvi
 d3CKpf1HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExEtYrhrwjT44OVfnfMT7N3
 aJt2ruH5U2LEOjnNy2Ci/yarG2zLeRkZVvRejDyU/55nqpbJYvvDVQ85osViLA6/vJ9zQltoldN
 8fgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PDk6WH9qvPC2e0Jc_eJJrTXiWV9xwLFfigoPTy5GgAY_1767907096
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131819_594763_868B0375 
X-CRM114-Status: GOOD (  13.03  )
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

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 0879768df240 ("clk: nxp: lpc32xx: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Vladimir Zapolskiy <vz@mleia.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/nxp/clk-lpc32xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 23f980cf6a2b59ee1c93a2519fe5188d251fa12f..ae2fa5341a2e4fbe5f2d3ef9a6cf9e9d75180d59 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -975,10 +975,8 @@ static int clk_divider_determine_rate(struct clk_hw *hw,
 		return 0;
 	}
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       divider->table, divider->width, divider->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0


