Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4BDEF99FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESsYEinmAI9cWzRkrWAAeFjrdNwaMwa0qK/fG3RugZk=; b=EqmlnylXm1LTSSC0ONk3NPyGNT
	ts56E2nbiCGdh6wp1CsO3eXIVKU6fAnUU+QorN6RFGWe+dGaHfMyzq6apAtczf92K+FHUytM7fGGh
	C1LOq1ZZ7lR6uaR0XO7XUDWbT8vxhb1Kq5YnG7e7L63j3qSGfIBSPeFkrRAMVB+welxr2LMakqcL0
	iXNl3QtptaballDLkBH9V6ao0/J+bjKHWECBmRZ+EsOIJIK8YbB/ImGucbLq4aPcIEZ4vjlbvv+ut
	KTVzTh+TA0SBsMyZEbwl3WEszU6OE8spRqCXiv4jnBZu82OUhnh6z7bipXlasZxhRaPjc4hahyshR
	OQRwdzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs34G-0000000786Q-2W5A;
	Mon, 16 Feb 2026 18:11:32 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs34D-0000000784H-1Foj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:11:31 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3976080eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265488; x=1771870288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESsYEinmAI9cWzRkrWAAeFjrdNwaMwa0qK/fG3RugZk=;
        b=ZL2HM7sgXNIfA3QUD2EWGohg1K9GAa6btkDfLZDHCNgOz6DSfkhwn/Gz7+pya5rmi4
         YOW0Qzl//nNj9Vk8PWxdzIX/kOdfPdVcTdOAMS0JwjI3MIXIRXLeYtBBvLOB2YXJ5rDz
         5himUrZQgS2ab200IWkbJSbsoGl1JIqZkJGKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265488; x=1771870288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ESsYEinmAI9cWzRkrWAAeFjrdNwaMwa0qK/fG3RugZk=;
        b=CSfQ/o9Tnnp2foUHCMVUtXGFrP1N7P/cRZG3IUwTePLFMBfjvvV+kIdT763v/2HdSq
         LFOO78JSPI/OJArqbzmMPYFqP+bi17y4f1N29Cq7whIzxD/CwaU9M3Ly3xi/9JlJOXOC
         juzitWoYV0z73Hhg+fVQw8Cdhwtj5hWffzsC0z0fYgWZAAC06qNx5aFlc99CVVJ9ULQW
         cWPNArZrcuppiGEUBX8Sx6Blax5dfF3zRt0Scwa+Ioy2eOnHrJk/pATKDoyMeNCCouY3
         2dwtWrWWOK7mbqkfwNdla4JaYcmXXINqXc4TYZnMMYKV1HXZfnJtjFIhCXiWuJViGxzz
         7KNw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Bc8VTex9G27apWv0SAHGBabMsRnKiBQx+9qIfJ/vqxOFpg7ZUUqRohN/FVuzRid8ZGj2ANedBX3sjf84U6/q@lists.infradead.org
X-Gm-Message-State: AOJu0YzhN2nYd3JBBB2QLu3RHI3jJBujG83AClN6QmbsYmr37cIWEB2j
	OgCVmNmFHJ3z39nWlbwpaF/MzwCBlPohl57O0MuNKr9C4VJk3yNAeqxT00o3M1qRQQ==
X-Gm-Gg: AZuq6aKCV7+MtoySVKxu/tsby2P/DWFWVW1zO5OaOnjYdS7oMLuesm5TS/xgefbSufG
	7tOUDGwH/CVOxL7134QaEGtxz2eNAY8rcFgfZc9g8oBZW9LV/JuBIbZC3I5/Bfvl2wrt2NqqUKW
	mr3SyGJYe9raK0kIP6MNTD+mKKvhq/hj71/Aa2n24hYiteEePOmjWs61l5lbp5Rw2prEBC8y1mt
	3Mg9UPtAuzwL8eIyf20eSn2AvirBwsFh94njClcVU1Xd3NiMW/zgOzpWy5XnGhQS14kX2xpc508
	SycgjwpYotrMQrZXuJGdFvz0209jn9BATVUM6SfsKT0KCaQMm/jiACjvFgmHJ8tz2bQa11XZ6EK
	auLC2rHQmNnDR/gGdvVU8/ItNTZmSDLVGUXBx5yBPkvsr4SZHyONjWKC7k/cbwrbAalYWu9yGW5
	NOKeQbkO8As/2WQ+vNdMpCRfem9/AzpQvgIA04z5UFTarcl+5dggjQKgdX1bkUwKtuxSG6zxl+g
	fw8TXBOGFw=
X-Received: by 2002:a05:7301:1f12:b0:2ba:8d14:631d with SMTP id 5a478bee46e88-2babc3baca4mr2777562eec.11.1771265488333;
        Mon, 16 Feb 2026 10:11:28 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:26 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sudeep.holla@kernel.org
Subject: [PATCH v3 03/15] firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:40 -0800
Message-ID: <20260216100943.v3.3.I4a01e1fa771c0b1ea7e35882784e4b7f8f33f65b@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_101129_339926_0B20B606 
X-CRM114-Status: GOOD (  15.63  )
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

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

The mbox_ring_doorbell() explicitly documents not to call
mbox_client_txdone() for doorbells, so remove the call.

NOTE: upon first glance, this mailbox client appears to send doorbells
and regular messages on the same mailbox channel (smbox->chan), so it
needs some extra attention. Specifically, the new API behaves
differently if you ring a doorbell while a non-doorbell message is in
progress. I don't believe that this is something we have to worry
about with this mailbox client, though, because the code was calling
mbox_client_txdone() after sending the NULL message. Had a non-mailbox
message been in progress, that would have marked the in-progress
message as done instead of marking the NULL message as done.

In discussion [1], it was further clarified that the driver shouldn't
ever be sending doorbell and non-doorbell messages on the same
channel.

Link: http://lore.kernel.org/r/aYoPLzOjPvJbu0Kb@pluto [1]
Tested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Updated patch description based on Cristian's response.

 drivers/firmware/arm_scmi/transports/mailbox.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index ae0f67e6cc45..c4561441ac2e 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -324,7 +324,6 @@ static void mailbox_clear_channel(struct scmi_chan_info *cinfo)
 {
 	struct scmi_mailbox *smbox = cinfo->transport_info;
 	struct mbox_chan *intr_chan;
-	int ret;
 
 	core->shmem->clear_channel(smbox->shmem);
 
@@ -338,12 +337,7 @@ static void mailbox_clear_channel(struct scmi_chan_info *cinfo)
 	else
 		return;
 
-	ret = mbox_send_message(intr_chan, NULL);
-	/* mbox_send_message returns non-negative value on success, so reset */
-	if (ret > 0)
-		ret = 0;
-
-	mbox_client_txdone(intr_chan, ret);
+	mbox_ring_doorbell(intr_chan);
 }
 
 static bool
-- 
2.53.0.273.g2a3d683680-goog


