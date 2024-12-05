Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D51E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 22:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m3lyXrqzIu+Kk45XA+AociMWK/OJuQLe7K4aBvShe1s=; b=PbxIuu3Dmqb1Cz4hOL4WzkP32X
	YY5e/es0Q8Yo4zqZkTDbmfKjoerFl7lnof5Vl8fLaUYvVT3ZIZ9dVD0YAhhg6PtmkSAxWUnr+I6Hg
	QNWUsJBxxEcUUxWaz7KrFFh9qtcM4jwNYt3TBj/T3uO6Pab7DIba4o+ZtkrMPGvbvRPUKM4JC2JDd
	seisA985ZSv6Yo8dKg+ttqK3Z2evuHBcLQRXCReYhDBrfARY8Fu8jsFSXtNqzVVcpItxzCos9N2J6
	Rum6asLlC1SorJYwGdOCF93zpMg9JgBdOcmuQZGviItwHP3f3BG4Y+rDj4kJZL3/7PDgJdNmVtXwd
	AsZiWfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKGC-0000000HTVi-18cb;
	Thu, 05 Dec 2024 22:23:48 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKF9-0000000HTIu-2UkH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 22:22:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso102983566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 14:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733437360; x=1734042160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m3lyXrqzIu+Kk45XA+AociMWK/OJuQLe7K4aBvShe1s=;
        b=MGJ9aTWD8xfklfOhBFn/hEHl6FC8ddH7v8S7pQnl9fufBw465Nz6Gsbu1jWGFvaz0R
         8uXxVcAEnMQoq7yo1biXjpencT8+aUpnR8RUfeu7aSOTadPF9g+O3xV+8X8njvLyf2Jl
         J7BsO9a2MJLa9bcawFhhqX+c8k3BwoadJtYQjCayCVX6sisARhUpIr/aoA3cXOrGCBV4
         pBDzzHMAj9m8zb/g7nFzkdySLZ2B5EmIAmT9oDaecFFZeRGTKUn+X4Y6Qf/iCgkoXz90
         pa6oSsXXQRd+Zu4RjuBDzfkfYoqZRAwQDF1Sc0nTVsWPbgmuapuWwMrWgSqbMyvAld98
         cFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437360; x=1734042160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3lyXrqzIu+Kk45XA+AociMWK/OJuQLe7K4aBvShe1s=;
        b=bM6gyYSjFd8QGWJ9KX7d0qkH7+NcwJKg/Cglu2ftYDcAtCnvFZxj50dXQiHPsOh/m0
         6vk0DonxdbqT6EcnS8B/tYcPYD1Kx4T0OetmzFYNCrcWQK8mvRQrewHrZUm928SsrVMt
         blHDbGFi2DIEHIHOP3UOPRRd07Mt8rXu/b9kha+KZdOyalng8OuFlGLnE6xJXYQpB7pn
         +Jm3QGfM2NjYFmCLsvwa6RswHIc2KeBejTcgKSH/8FFcFaVALD/B3CIISRHn8hZLOKhy
         n6QYdPGAtoXIe94yHzsT/zyErQdvdJi2aMsD87Zc6kQ5+Iqq68N++3SuuJ8Zyg3fXKbm
         jD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFvcXHb+mOtzwGiUXn/vvzUaTLHCGFfZ/vA2f1aQGzyvQHtXPUKYUcRHBHK0NlNrd5jJqxPC7ouwTmshVyq5qV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3aTvN8Eui1BVptPPICb0oxIVw3mQIX8PU3D8eaoaVvOYlJ9zH
	OqmhREYEqoULpq3Cpsp//YZGyO+hcZTKu+o8Ak2IcknWmHsRgHbv
X-Gm-Gg: ASbGnctuJ1kF1viOYvkpl39MxVz+FIjJCk6LCVw5si3kPgQb8hrfuSpgnDUeBdjiSMv
	rEIsnC+Q9TZKZWjzMbp7shbLkSuFAonQVrA+WNqUANIUDSmsh/4/LQ+zW1flw8y8RK25bZ/yNpf
	Mq2X2d+G2MOjI8Ig5WQRX/U4IM/2W9y7ExcEiBS7UeTPxEBhwsaswlDJaHqO9n2ckNaAIhPwvez
	a1ldFiggPi1kXI0hAI5Q0yXrctkDHLBDiXiuBWV+rwDknSdh9rwmk4WZWj1
X-Google-Smtp-Source: AGHT+IGcrLT4gONP5gatqkYWWG2Utr7wcaZ76fP3t5w0AD0MTmF9LBS0SpqfRAOkQ11uPNvWm5iasQ==
X-Received: by 2002:a17:907:7703:b0:aa5:449e:1a1d with SMTP id a640c23a62f3a-aa639fa434cmr49156166b.2.1733437359965;
        Thu, 05 Dec 2024 14:22:39 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e33f7sm148805566b.183.2024.12.05.14.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:22:39 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: karprzy7@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: skhan@linuxfoundation.org,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Subject: [PATCHv2] HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check
Date: Thu,  5 Dec 2024 23:22:21 +0100
Message-Id: <20241205222221.3094702-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_142243_693613_B5631A6A 
X-CRM114-Status: GOOD (  12.21  )
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

syzbot has found a type mismatch between a USB pipe and the transfer
endpoint, which is triggered by the hid-thrustmaster driver[1].
There is a number of similar, already fixed issues [2].
In this case as in others, implementing check for endpoint type fixes the issue.

[1] https://syzkaller.appspot.com/bug?extid=040e8b3db6a96908d470
[2] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622

Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
Reported-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Tested-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index cf1679b0d..6c3e758bb 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -170,6 +170,14 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	ep = &usbif->cur_altsetting->endpoint[1];
 	b_ep = ep->desc.bEndpointAddress;
 
+	/* Are the expected endpoints present? */
+	u8 ep_addr[1] = {b_ep};
+
+	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		hid_err(hdev, "Unexpected non-int endpoint\n");
+		return;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
 		memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
 
-- 
2.34.1


