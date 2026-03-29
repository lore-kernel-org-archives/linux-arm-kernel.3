Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACD8F3D5ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjxqXxyKEmiZIG77mggO3OoX/XZCUgPWLAbtN+CQczY=; b=uAo3AP55905VEe/mtwS8Il2SlB
	WAEKp9i/S2tB1QaSFIFsF7SJ/5wpN7z0MxzZ97JilV00t8oGxuU7bqnenXW/si1rzNl3iBUCTiQY7
	pYsNyiB2tZAxsAc1P0Pk8mcftNhByDow4Wa7W140a4y2UAnxviWbdl+xByIgj2yufmjeBst19dSub
	IXcxZZFYCwykOV5FTKrDb10z4mJ7y4pmfUG4fveREMIcBley3KbL4vnUaJPWYiVL8uIZ/f4wcDIGs
	d6two9+vK9M7O0m+0HJQ17vrFJe0V2DJNuWWF6caJK+05hF09jS4rw+Rkcj7AyfQivTm81kAw+MVG
	uj1qZ3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jYF-00000009dqu-0b41;
	Sun, 29 Mar 2026 06:23:11 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jY2-00000009dWV-2WpD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:22:59 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-951a4e8d1b5so997013241.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765377; x=1775370177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjxqXxyKEmiZIG77mggO3OoX/XZCUgPWLAbtN+CQczY=;
        b=Eq4EqYbHD4FilvADIjXoQeZH7M9V6uStZOcCcV/Co6+vyJxopw7TL7S5WVvC+Ll4HK
         xpWFjApZrfoyPd7MfyC0suF5FNIRMmYmvMDxccjveQXp9LtrR+8OSXOQxg174weV8jXe
         MTVv6uECWqu+QH2pq/LKGzYtgA0dIrje7wX2pIJSv5pCuoS/+YnpyV1Z15w0XfwBWJGN
         m4aYSgFBPIvWm8W1AUy3vcxFUkc4UNHh2+sb1Oy9IhYlj0OZwVfEzs3khl5js/yYsXs3
         mdfqN/hZee5GAKxjdYzPX2DJkDDjjN32RK7EvWrxpIFVHq2MeGxtePbqHUhC7M+qTYn1
         K9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765377; x=1775370177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjxqXxyKEmiZIG77mggO3OoX/XZCUgPWLAbtN+CQczY=;
        b=DjYqXkFOE8QW0EdEkbciAdObP9+n3o6/ABpxRcvVkFP911Fxmgk3ugUyPg8o5M88pK
         QayH509rd8uUCoRRX8VP7S8kxZ2gWUOH3bvTM0ENJdBepck+++ZDaWjkUjsgy5AcF5TP
         umMgQyI8OiYq/7DFPN8ZQNHPHt0ja/H9GersTd487PrR6ea9jv33YY6pc+qD3Sjf/l3f
         7Mc8JSn249ETkPogvFGbcAU9FPLfFLD8+KB44jlcMOvIA/CT+D98lN1GorSK5GnC7PYx
         eg8g1jQIe9m2B6jrzPyFTV3hv5AksSknTNlwBJxCVc3yfrnsybxvLO4FBTMwkmxGt4MO
         7SBw==
X-Forwarded-Encrypted: i=1; AJvYcCUl0L2rvq0C5ghTKPOkZotR64EM415106IxoQAB690KvovMn78tOHx2wW3ObZK4AmjaOxgDw5WiaG6/IDo53h8c@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+LlL62Ia84ZV4MgU2U74s+hRH+a+YQxN0DdZAzMHNtNkT39v
	JSeiibPz7R/DYPKh2Emj6J3LZhzCJXWxGTSrYSfTuXc2aduqUrLJKGug
X-Gm-Gg: ATEYQzxLv4VKkTRp0jkemz/DqpwC4JqWvb0lvJPavf1TvX0VrqXZvIw6ROw3T3cSOav
	0y5lVYfjHSDc5wwbhmzCpxS2JVuaDutngJldZaoriuO1E4mC+lJhDAg3MjpeFyEAnAZC9X0mHx5
	VPBPilTfKh28FWsHFOlr2aDhsCG/p6GnYK7KS9OGQWGF3oVS0iLdKPrgAQYQmFHO7t4xKUHPCDB
	gW/yhyLhmK/B8CcRh1Xyb5tS0n0j2Bk5YxkLDmexp5VTPWSh1Laje0l71LETkBPi0+Bn4pmEwYE
	as9IeKPfMhefbl9r0zcaa8WJxNQRh8gkx4pPcy4UgEXE2YXUOszWv5rSppnA5f15P+5JV1I+btV
	JZgVHodLLaWaiSKae331GImGddN+nndLIEfJic87hRk8RAyrR3g7L5gkNlCdD3NaZfJ0bJBR4b3
	SdMp+U3NUDSQa3Xla4mUfS/X4H
X-Received: by 2002:a05:6102:160c:b0:602:86a6:986a with SMTP id ada2fe7eead31-604f92f1d79mr2960909137.27.1774765377217;
        Sat, 28 Mar 2026 23:22:57 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:56 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 4/4] staging: vc04_services: vchiq-mmal: fix integer underflow in port_parameter_get()
Date: Sun, 29 Mar 2026 00:21:14 -0600
Message-ID: <20260329062229.493430-5-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_232258_646928_FC6209DE 
X-CRM114-Status: GOOD (  13.37  )
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

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

port_parameter_get() subtracts 2 * sizeof(u32) from the GPU firmware's
reply size field to compute the parameter value size. The reply size is
a u32 provided by the VideoCore firmware. If the firmware returns a
size smaller than 8, the subtraction wraps around to a large value due
to unsigned integer underflow.

The underflowed size is then:
1) Used in a comparison that selects the wrong copy path
2) Stored back to the caller via *value_size, propagating a bogus
   size (up to ~4GB) to subsequent operations

Add a minimum size check before the subtraction and return -EPROTO if
the reply is malformed.

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 11af71309..914ab9215 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1436,6 +1436,10 @@ static int port_parameter_get(struct vchiq_mmal_instance *instance,
 	/* port_parameter_get_reply.size includes the header,
 	 * whilst *value_size doesn't.
 	 */
+	if (rmsg->u.port_parameter_get_reply.size < (2 * sizeof(u32))) {
+		ret = -EPROTO;
+		goto release_msg;
+	}
 	rmsg->u.port_parameter_get_reply.size -= (2 * sizeof(u32));
 
 	if (ret || rmsg->u.port_parameter_get_reply.size > *value_size) {
-- 
2.43.0


