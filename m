Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAD4E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 13:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rpk/ffLMQdXc9r1ZsbGnQaD0+ch0U8AdCVw+w16xuCo=; b=MeJr5bAsc/enJr
	XCVm7k4rDiP0kLjHSn+iZFlk2OKuctVJ48Yh8R5BSW6OT/FUsOfW2tu6UZxGqguSHOXNJI0Jijice
	S9rYQwfuLDuX89ZAZoPNknhxifVZ4nQVzcgXxUa0+K3qiHfoTu8zLbsv2zyLVqduEbstwlu4lG+/z
	EDkQW1K73YbYkyk08ZzUzpN3WRHtMxDDQugyVRyxm6Yz3FAFeGFd4ZWk//CdGrGAjIAIM/eMGUkxo
	0zLASCUEhBql/Uy5Uwy99IOq4xjhhjVtenOgRDMO33A5psc0+Awk5bYcc5BeDkgWZMtw0JxOS7uYz
	9+Jk0nbWzaDxudro/jyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGH2-00000001u2Q-2BO2;
	Thu, 19 Dec 2024 13:09:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGFu-00000001toc-1LfG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 13:07:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso8571895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 05:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734613672; x=1735218472; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpk/ffLMQdXc9r1ZsbGnQaD0+ch0U8AdCVw+w16xuCo=;
        b=mB7E/xKR9F5TnkR9LwFMBUe00tPtFF/EFJN3+4SVo23WcVOaRERIXyQfjqSdAViRZ5
         ufnEYoRXq4XthE9NRrOQw9cOa0C1z1R9qaZejDb9bqaOH+LA9tVu06r/JHWYODQWp2BI
         BfILUFaiTx3IKQcE5Y5z39ZGxBiFsyBMDJv1avrc4c11+dn94U0GCeV88nZ1jdePtwBw
         3QcLcnKTGywyn+9fCwcFydtNnKWJTCrZDjevRF6Qn6V9SA/j+dP/Cs/9iHOUbfNI+HM2
         /t6aL/hccpf5NccK+nwxpg4dhyzOn395wD4sYanSg+tN4GN5/2SeibHeOM5ZtrS7ABlc
         ZN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734613672; x=1735218472;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rpk/ffLMQdXc9r1ZsbGnQaD0+ch0U8AdCVw+w16xuCo=;
        b=wwr8TbcgE4HsiQyOpbzimHPp8mq3MIUC3x59vwYwDJXvDlLwUiH5PC61zI+xyPngvt
         Z2/sG0/drCTtzc88Vr99O29wlaJIOqKPfGcH81unVeiTcOhcMUCQ3HvULjOQPjlAjyiU
         wCHo2cJS2nztr2uUvrNYsmSoCNib2ZO4ecNdjbMLJ/XRz4jtV7y/aV7CI1T6mrhMq71u
         4LXFkLZrt+lcvkXaDywDn3GNBPRE2YCS88NdtyaCO8XKmBih6AK2GlxpwrsmobWFiA30
         pr6v/Y6KSlGauoD+3DK2PiajmdR4isbI2X718gQlD00XyVarDM6WoBFLpz2wJYQ4JCPj
         85qg==
X-Forwarded-Encrypted: i=1; AJvYcCWSTVx02QTr9Q3+ssYF+Pb6rb9R2f93AptR3HWqAtsypBCZRCGy4I0P/uQpP9T5vgWs0GWso36yb0E2BHzXp8WF@lists.infradead.org
X-Gm-Message-State: AOJu0YyA1WQwVMgqDr7NgFTKTI/qtSs6U7tCJbyh75yzVu6J8SqlSRky
	c7iyAqXwFTM2E5Yl7nQR8FfV2ugQoKrLFQbo/Ap3OLjN/pYt2orCdidbIvSm69c=
X-Gm-Gg: ASbGnctI0y0WBpbv6lSp5itwpJHzmOqEfOEOnSnSVZ7oSerPcCmZWpOMMuILqzVGQJR
	rWf8ttMeHV5vJKig7w9iHAD3Q5cua8QxS2gXAbFaUGrSa87N9q5Q2LbmUeBxt9c158T1q2nesE5
	FsdZ0bXA5XXHqjzPFQ4069xQHG/cNBngleZFzGGb2dIFBtOaO9gIJ/IjqrDz+rh13R+rDLJpruH
	g+qLuCmq3AbzhWex8KX55JOnLoSzAqvpjiMf2eVpBKqP5mnsDuy5rS+V3ssfiURx9P+2TLEwreD
	C61W4N5MKcJHrx1/jd1ieSGNF/KC365Qc4+c
X-Google-Smtp-Source: AGHT+IEL8UXjs8X0S7UtKDlYHBSfpKUQ5jbhCUs1olN7+uCkgGDEWmfHiA7Ew8uzxHg+T6Icg5yzVA==
X-Received: by 2002:a05:600c:5492:b0:434:f804:a992 with SMTP id 5b1f17b1804b1-436553f69demr60792685e9.32.1734613672439;
        Thu, 19 Dec 2024 05:07:52 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm17436705e9.6.2024.12.19.05.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:07:51 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/2] mailbox: add support for clients to request channels
 by arguments
Date: Thu, 19 Dec 2024 13:07:45 +0000
Message-Id: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKEaZGcC/x3M0QqCQBBG4VeRuW7BWYzcXiVi0fzVgVprxsIQ3
 73Nyw8OZyWDCozOxUqKj5hMKYMPBd3GJg1w0mWTL33FnoN7tNMSFa83bI7/JOEe229sdDB3Yj6
 WdUBXBU958VT0suz7y3Xbfrz8eNNuAAAA
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734613671; l=2747;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6hPBLgMmfnbU5fJmTeNIW7KbcBrCAcdnrr+wM2OaDRs=;
 b=k56rdsOke8IWmYym13tETHNkwywcDz1k2b/m8+2Albs/Hk+zaZrl+9E2xeXumoTTuDrdCRDz/
 fUA8CKuObS/ClYgEF206bdv1LabJQh/QZtes9y7zmTEeGYJtBlKml9D
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_050755_224193_D975BAE7 
X-CRM114-Status: GOOD (  11.71  )
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

There are clients that can discover channel identifiers at runtime by
parsing a shared memory for example, as in the ACPM interface's case.
For such cases passing the channel identifiers via DT is redundant.

Supply a new framework API: mbox_request_channel_by_args().

It works by supplying the usual client pointer as the first argument and
a pointer to a ``const struct mbox_xlate_args`` as a second. The newly
introduced struct is modeled after ``struct of_phandle_args``. The API
will search the client's node for a ``mbox`` phandle, identify the
controller's device node, and then call that controller's xlate() method
that will return a pointer to a mbox_chan or a ERR_PTR. The binding
between the channel and the client is done in the typical way.

This allows clients to reference the controller node as following:
        firmware {
                acpm_ipc: power-management {
                        compatible = "google,gs101-acpm-ipc";
-                       mboxes = <&ap2apm_mailbox 0 0
-                                 &ap2apm_mailbox 0 1
-                                 &ap2apm_mailbox 0 2
-                                 &ap2apm_mailbox 0 3
-                                 &ap2apm_mailbox 0 4
-                                 &ap2apm_mailbox 0 5
-                                 &ap2apm_mailbox 0 6
-                                 &ap2apm_mailbox 0 7
-                                 &ap2apm_mailbox 0 8
-                                 &ap2apm_mailbox 0 9
-                                 &ap2apm_mailbox 0 10
-                                 &ap2apm_mailbox 0 11
-                                 &ap2apm_mailbox 0 12
-                                 &ap2apm_mailbox 0 13
-                                 &ap2apm_mailbox 0 14>;
+                       mbox = <&ap2apm_mailbox>;
                        shmem = <&apm_sram>;
                };
        };

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (2):
      dt-bindings: mailbox: add support for referencing controllers solely by node
      mailbox: add support for clients to request channels by arguments

 .../devicetree/bindings/mailbox/mailbox.txt        | 19 ++++++--
 drivers/mailbox/mailbox.c                          | 57 ++++++++++++++++++++++
 include/linux/mailbox.h                            | 17 +++++++
 include/linux/mailbox_client.h                     |  3 ++
 include/linux/mailbox_controller.h                 |  4 ++
 5 files changed, 96 insertions(+), 4 deletions(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241219-mbox_request_channel_by_args-7115089ed492

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


