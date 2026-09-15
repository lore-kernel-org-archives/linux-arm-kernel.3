Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FBAC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmgxL+YzDrrZHo0jFAYUF9npAPr+/wsk6K1vfZ01BB4=; b=S0izX4MYe+CbxV/lybclZOOv6w
	LpVo0dgRsJDnMI7QWThPerOn3VHtrMVQghF2PNrBNCTnz6fJwpWjvstKoE6Dueu96NExiCrO0polm
	My4dMJedygRh2RGjU8Gp2CHpvFqT+P2xLeUK9HiUgImIjtrcUR7YRGTHQ2fFS+DejcvhlyLtRoj8G
	VcuGF51HzyBXka7osURdXG/oMprq5j8c42m3axUb/Os4zacVE4zZ9FIO3rwjt8fmEI0gVe5Ecjhzm
	IINnOSojh/uKyfyctL6NizRhRwCLC+R3I2CnTOYsP2K0diJWWR3FmpEB6so0noHCK12ktE8KjodUU
	+0T/peGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Hqh-00000004wiT-3IHC;
	Tue, 15 Sep 2026 01:20:39 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Hqb-00000004wgh-1QuE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:20:34 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-90cd4631090so4673786d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 18:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435232; x=1790040032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmgxL+YzDrrZHo0jFAYUF9npAPr+/wsk6K1vfZ01BB4=;
        b=ZkVa1CVnIXryZ9QpkcI37qux/6Vi//UGSP4dUYCbATyvoHxTQgS5z6VnZys2x6q0jz
         mYdm99ALI+1nMFPZM0BwdAZLLkP5AU+IYCv78lvDHoxFnaEJcIMOa8wJpDz4kZ9LRJpv
         DfOSJ7XDheak0cIpy+yfn7iWXU1phfyo239N7VpBC6jIncyCW97IIfI7WI9F9AX7a+0z
         +OkEFEy0REYvXHrw8jGwmE8s3JcAI1Ix3kt0oSLPx78L8BE09G/lRvTHQ1UcOg8iS/PM
         gLtQ3SadZEKJLSrbPxj10T+cxAkLhW97WmikbspCiETzEFYDE+qNUsL4tLxQdj/lb63s
         ysWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435232; x=1790040032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmgxL+YzDrrZHo0jFAYUF9npAPr+/wsk6K1vfZ01BB4=;
        b=jcMYfW39CprPoaC6OzbkAZ5+jRuOiV6Obv1djLA/4MNju6MpjyvKdN1V1zF7UP3/iA
         rDGjpKeCmDE+jdofeAx/cZco4wupPAr2J76thHeUKQPRczQeJdjWBBHJDNkAhDuHe2bs
         SPfQ8Iqo0lz85sdsT6cSj15gGc+yWKZ3B8udVhx4xF3Wg4i9Q+DSYpCHqZzrAXnmFDfS
         2ot36b2D0JmzXs/j1ykr9OfV63YtnZRksEhI5n4hwbVMkyfz49twOcWsMx22o2epWoGq
         qv/eEdHCEFf+IRX8NBmpPB8TrLha2BpUZigbR/PmjrvcXrjsMMGJ/l6/qQtYpFhoPeHm
         hO9A==
X-Forwarded-Encrypted: i=1; AKwUvBwCj6hulD8YJ5PcfZHaL9vtgWY/SCBQWXjeZY/1xFXtbe78SR6r8zO08GuIe6e4Egns7uvbIyR7smm1hK4pik6U@lists.infradead.org
X-Gm-Message-State: AFuF++le2mo6Q77JSCGEa3qoo4aVDLg/ma0njhgWp6Qqog8SToMp6ubK
	/zcctjbadbXYFhJ+rsjPHcKea6kZ3LyxN36uHfpneHXLJYmpuMrAjtk=
X-Gm-Gg: AYBFou0wqM2lJAazxhxJik2gQUQsTIKQg91+FBExR6rNwEEBrekWtr72z+zYruI2z/g
	rldGauPmfw1VdlcKPfhTM5tmMP5Q2WrljymiI2GwZMZuz20TRBEKUY4n4kAAmKERfLV09j9jOlt
	AklAt2vNWrNBEDmo7Omw7DlYJ5nC4fXl1UqeTzplc7cM54NehEEl/2WaMJPJwreD04R4vwWIbh2
	+CvXHc9YdpxKawFzgePY+2NIqBvZUViddMvkXLQvC+JYvqDVP1Lf97gOLNeYgJBUZ1RRg2pOzjj
	GFfXLNmoTxA5cSZi9tl85njmyyxR55MJnGMIcOjnJxYnPDwq4KW9YRDGCFHO/2ZGhkF5473QPOR
	cBZejn8A1JC3Z0/0O1838uoKs6sUyzOH0U29AFcvDlHbGm3b5wL7nP0rTs8LGGgf3zj4ET1/4xd
	dvqcWM6rtUMyYiwru+GnkWwj54/TCEs8UcAULxEUFF8EuWlIQTdZdFfaAVPW0zg8l3lBwqKCefa
	Z5Xh/TqM7XnQRYJKO5+aV+77jtMCsEAQdvwwKoIEc039miYEju23XfGThVH2GTHsWi06Kb1s09E
	OPLx+p/iHQR9yaYrMENXZItOCwyzDuYvA/CeIxhbW+1EwV4aYQu3x642TyG4Og8N2AtWyQ==
X-Received: by 2002:a05:6214:4383:b0:910:42f3:958e with SMTP id 6a1803df08f44-9123441de5dmr26302696d6.27.1789435232163;
        Mon, 14 Sep 2026 18:20:32 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:30 -0700 (PDT)
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
Subject: [PATCH 4/4] usb: ohci-st: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:11 -0400
Message-ID: <20260915012011.61874-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_182033_499424_DE23B5E9 
X-CRM114-Status: GOOD (  10.16  )
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

Fixes: d115837259ad ("usb: host: ohci-st: Add OHCI driver support for ST STB devices")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
--- a/drivers/usb/host/ohci-st.c
+++ b/drivers/usb/host/ohci-st.c
@@ -235,6 +235,7 @@
 	int clk;
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 
 	if (pdata->power_off)
 		pdata->power_off(dev);

