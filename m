Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82616C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 00:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Q6wqAkPgpNZPhvYMhgg8DTrDL7IGLoO4HjSh2P42no=; b=kRPdtIN9KatfUYHrjiSqjK0uhL
	eZIkskjsXbyV+rPR5mIxD+EK3W00YFAkdMMfSzrykuGNuIjt0VBzgx9SzbDS3MxMI6t4P2uxU9Bmp
	D+UZcdlhqx/OH39mNIuUyZLrv6RkEpwAVIsHDIxQxcW9ZDHxw+EDkNdLMePOchuppN/ctKYYsHp+B
	UOA8USXtLgM2q96kvJYR8GAVGJPzbnkVY/9GpgFSaUhjd70fGg/N2iDehft7IibA6njsEiGORYIy8
	f4OUJmW0TR7tNOzMG3aDbp0jXO88IDC+99SLQSENypVz0Qs8y86pPWF/N/g35bbIL8VlUp7zSG28z
	u8r9zZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTvs-0000000Cu7q-2Kc6;
	Fri, 04 Jul 2025 00:05:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTIB-0000000CouL-3Hp5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Q6wqAkPgpNZPhvYMhgg8DTrDL7IGLoO4HjSh2P42no=;
	b=g/vEZyp4QzxOopGCg28BeJD8a1uQKLavL12EcIua0Y3Iw4Q72ZJ7b2F4p34IWjRrEJk2Is
	18sxkzQMmD7kq18QqG3xN96DnFpDrR5/lYCeE1ZvGVv3Y4jPyLydNGUkYUOxYMucn6VL8O
	kbPT4+J9hMFfonAhi0nwWCyPCsa4SX0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-m4fAGWU8PH2Lb1wko57OaA-1; Thu, 03 Jul 2025 19:23:01 -0400
X-MC-Unique: m4fAGWU8PH2Lb1wko57OaA-1
X-Mimecast-MFC-AGG-ID: m4fAGWU8PH2Lb1wko57OaA_1751584981
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d4576e83cdso85301285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584980; x=1752189780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Q6wqAkPgpNZPhvYMhgg8DTrDL7IGLoO4HjSh2P42no=;
        b=RVHBPwk9/55fx658aYaMqXzvQXTWHojqIegcGOPDidM7XIVjSftUOGIGpG/dBYEhDo
         GHaMN67VJeTJp4tXecsL9q51WQXraq+HnpuiPgZ+yFzsDXYnZDDS+IcI9Nj7CxSkLKGv
         sKDBqbf6VaZCbcc6LJ2/W1a1Yev+Pq3KxXMuWDeDVcgIapTG+9zG07VNv7WpiS56FXfk
         ggHC1eGZMs6Nio0V4+4UKjbPNNI/O6LmxijwEAt1qjv7QWBVlA1xsj2JpCvwlyoCVGuJ
         1/HjwtW/fqebkNwKw8wzzbckm8JlSzw7pZLQmIbHP3FJFzwPvtOrpE6mMUFYsQLs2Yiw
         I1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj7QuXSNlQ7vuslGuchibg648z1IAUfz/GKP/AdlfFp59PEFBFGGf2+QJU9FfBSVF9hMTFsJl94NLqoHSPmdR1@lists.infradead.org
X-Gm-Message-State: AOJu0YzNbM0r3ucp4QVfXQw2KEUA8ZzDv8hr9GrEdbB8bPfLH4FJ6b6X
	A0wwSQVgh0zzScfZhsA3IDLO6aR1ikBAAXDOVMGy3YmOqll05KiqDrRJJZ/1F+vJ8mGIiudc04J
	ZUeMJEWaXVsAMGIsnwnZqhM3u4ycAowSfcgrhZAgYtpXLWzxN/SmCPh07K04VHfkGqYa0Iv1Pbk
	MD2H3hVO+QxNBovADX8vG6OdbekfovhPMb89zQyaf7/lJ7GW8JfYyI9h6B5n8=
X-Gm-Gg: ASbGncsfpG2emFxHr5d5RlCl80WKxhtkdUAffxw0EopiZc4KYc/k8vHR6WniCR5KvZR
	W2kW9jb/Da4+OQsBSQM6MjlTUHKJPDNQZ9jV0mMYkEovy5XIvTrwDwyYgqxE54GFfPjM39CWhHH
	IhUD8BkUbdwuadNIm0y6oEqzSx0mCk9JRL/TqSQOdXO9Y4G++8dtVwj1MQRWwCA+kgkxoWfKHdd
	0DWou/Mtp6EECS/UKOEPLOadtHbf/jX5Q63MPbLbJNcA4ffPgieh7tUPesZ0NrC3qccbCgn7q55
	qmCc6I6G2az8FyzR0fzDn62NAbg4Rc9LKWjF8zlD2pvvPjA/pTkhVTOrWe9/og==
X-Received: by 2002:a05:620a:2b8c:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7d5ddae44aamr46066485a.14.1751584980129;
        Thu, 03 Jul 2025 16:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR/q2miTvF6gvmsI+7e+iNrCdk0wyNBmWfZUXnHvqUMWXThHnR6m2VVtbns1V7BCNpZ6c+dw==
X-Received: by 2002:a05:620a:2b8c:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7d5ddae44aamr46061285a.14.1751584979556;
        Thu, 03 Jul 2025 16:22:59 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:22:58 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/10] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Date: Thu, 03 Jul 2025 19:22:24 -0400
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALAQZ2gC/x3MTQqDMBBA4auEWXcgjW36cxVxkU6mOrQkYVKlI
 N7d4PJbvLdCZRWu8DQrKC9SJaeG88kATSGNjBKbwVl3tTfbIX0/SJlIMGouqHlOETX8GL2j++P
 l4oU8QeuL8lv+x7sftm0HyJxRZmsAAAA=
X-Change-ID: 20250703-clk-cocci-drop-round-rate-62c89b2d4c6c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=6416;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ZubPxnRGAAyn5xIgslZ+93JU0NMJn/KqRavgAH8p3gg=;
 b=mVjR/1H4Pz8wUXIcqPHs6qoh9Y8tkWR2r6b9NT4k8OscHyiN1L5QE90supKbCmLvSF0f9XJLM
 mlpzbNU+eChA7PKTZOxbNDDQ0IfYgj8n+RZ6NCz8QDVxmVCRk4UvRYI
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KRV2n4M6iuA6QYfpiMRWnV8Eg1Nvjkjt69ZS1FhfsZI_1751584981
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162435_891197_B72ABF0C 
X-CRM114-Status: GOOD (  18.92  )
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() ops, so let's go ahead and convert some of the
outstanding bcm, qcom, and sunxi drivers that have a round_rate()
implementation over to determine_rate() using the Coccinelle semantic
patch posted below.

This Coccinelle semantic patch is able to automatically convert ~95% of
the clk drivers, and I can clean up the remaining ones by hand. I'll
initially post some small changes to get feedback about the approach,
and I can post some larger series by submaintainer once we get
agreement that the approach looks good.

I boot tested this on a Raspberry Pi 4 using Fedora 42, and validated
that the mmc driver still works since it uses the bcm2835 clk driver.
The other drivers were only compile tested.

There are some other cleanups improvements that can be done to some of
these drivers, however given the volume of changes, I'm only focusing
on the migration of the existing code, and making changes in a
deterministic way.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (10):
      clk: bcm: bcm2835: convert from round_rate() to determine_rate()
      clk: qcom: gcc-ipq4019: convert from round_rate() to determine_rate()
      clk: qcom: rpm: convert from round_rate() to determine_rate()
      clk: qcom: rpmh: convert from round_rate() to determine_rate()
      clk: qcom: smd-rpm: convert from round_rate() to determine_rate()
      clk: qcom: spmi-pmic-div: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_gate: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nk: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nkmp: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nm: convert from round_rate() to determine_rate()

 drivers/clk/bcm/clk-bcm2835.c        | 17 +++++++++-----
 drivers/clk/qcom/clk-rpm.c           | 10 ++++-----
 drivers/clk/qcom/clk-rpmh.c          |  8 +++----
 drivers/clk/qcom/clk-smd-rpm.c       |  8 +++----
 drivers/clk/qcom/clk-spmi-pmic-div.c | 12 +++++-----
 drivers/clk/qcom/gcc-ipq4019.c       | 14 +++++++-----
 drivers/clk/sunxi-ng/ccu_gate.c      | 14 +++++++-----
 drivers/clk/sunxi-ng/ccu_nk.c        | 14 ++++++------
 drivers/clk/sunxi-ng/ccu_nkmp.c      | 23 ++++++++++---------
 drivers/clk/sunxi-ng/ccu_nm.c        | 43 ++++++++++++++++++------------------
 10 files changed, 88 insertions(+), 75 deletions(-)
---
base-commit: 17bbde2e1716e2ee4b997d476b48ae85c5a47671
change-id: 20250703-clk-cocci-drop-round-rate-62c89b2d4c6c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


