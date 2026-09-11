Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539B8C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=; b=TVzNeS+L6FFHQFtLFtrIplcJrp
	GhIVCL/NcSoI6Xh697WJ5LGrligc66VXOT2KVW62xOzzUimWdOz+8+G9KpiAibwOPAoLvWw57fgFI
	e8HT2dgnhslpMi/H30zzPdexvCNBG7m+KeGhowxMNqSwse9P1iuNBe0FvWrsVugK3Yt/0iv68Sj4A
	2FqdeV8uP+Ed/Kbh6ty6XZC9gq+KMz7JVYVcBeWc96FQmeshbJvMupwKjp517wMGa++nJyObRHbRD
	9DcC9AgnBLCWr9raqpF6G7G5ywozd9q3iOvnm1Hbwql2NFQpB3M60OrsDVt30+qLdsFx4i3dHykKs
	d12/8SKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4taa-0000000FqZj-3pX1;
	Fri, 11 Sep 2026 05:14:16 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4taX-0000000FqZL-3rPW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:14:15 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d90ba1d807so5513485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 22:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789103653; cv=none;
        d=google.com; s=arc-20260327;
        b=YtcXrALsYLdYa2Ek7Zf40lN3RY6C9OtHm7ZW6XxAF4fZa5Ilvlr/BdrOISHHG71nFd
         WFFK12LhsLs7iG3HRE0iuQsQWdkhbr2ahn3vQjd4uMvu4zxYYzJzIz2D2yyiCcjw12Ab
         29GdguWfCdSMAXV5WWrW98v8caQpq5UFOX2Dy4MYKBGoJdalVmEhinrtA/Exc1RJvtnV
         0tIby5h5rz/CRCoWhDvGyXHKkpr1AoJHD3wyyHqx/fupgn9D1CxTErqOADLFUhuhYPlf
         oB2+IJoRfjIA1wbsM/VYAaRlhDEFUg0KCzUG+GkMbN1lY0UhUjJo5PlRXSodfGqnLRfE
         aWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        fh=VlPbqDu02PI7TkbBB26IC6AJ9/PQWHpWsJAYmAh/82o=;
        b=RMGGdq5PcUgqJ7VTTHjXm6PAqUJ+z2Yv6EALX8LHkm5PGh71dWSU5/+gjwR3LkAuyM
         FL6OCRCVBTxF0JwoZSQZTPeR/4YdaRmi2o71V/jAZ/X4cu1wqF8jc3XKXe5Qv4ORu8NR
         MZLGv7FIAtv+jp0XISP9Irmo92MuOEhtIcwlX0xMueAp1oaQOg3Vh+iwFABxwpOksmSB
         Ys5LimZeS59MxfQAeE4Aq8vlg2VdimdcL32mKVyDmIVwgyn9/uIHUovr1GRea0vQGDjl
         1tW3NEHdMhkLEYTbK1GbAnNABUTAWLNga+Csnn8WlGCbAwDlP+WIrKMWH6lGII/7oB3r
         9S2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103653; x=1789708453; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        b=lKbY/7HvzwP3i94EuZVPdPeKcrb66q2e+/4oT5ziwip/I0vJn96l8RE9uA4OCEawo3
         nbIMJ/XXqeyqArQzuAADSwdKoEz+XWDpnya119Qg7sJrFyvfsPdGbVICPr499NUoP73T
         WmbVB84ZtM8hXD+ohZBaDICyCxpe9rclaTOeddo+ASYYgPZixkkYhOK/J9xpl6+MehxZ
         fXPDBIqi6BcMDCBHHTNUXJjRnYlUNXNl55ZzTLoP/N69GPTX+SM06SmklXMm64FOxuxb
         R44L6duh4jjgmImmoGny44xg/pbwfHR83rNRAMIOFa3ofXQxt7Si7swungtR0TF9DT/t
         Sr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103653; x=1789708453;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        b=ZkXsKRP+NJpDwXapr7xEnKuJCc9u8rlGN5vo504e8w/8A+bXWh1n6219ze8dT0ILh6
         7Il7jUcuWouE67iiOMc0/5VjDuDkWyWmmZycMXzwBNiChOsyP9VYbwEKf/nEv6TQrLw+
         eFbSlWqse4ZgBKEXh8QQrx5thK1KI9ZnlaCv4ImkvmX+JrW/tP0izkSAI5MTZccwNBoP
         cXtdNUqCmwQAdyj8wwgXPEnYRGRTvlHowdwYTKga8sAPf7R6Ro2sV6O6ldl3b/T/00xl
         R3TsehO1wUoBOi1oU5x2uW0IGv+6iTf11rAvSNu5IEqVPaV8szuD7e2nC8zZaUpy5Sv5
         M0Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzqxa+bUnhj6wPs0l1haF34BP6R7Acfz5567Q0jyt1+CexOK6MwH8lIGbcY22oZBxwMmRq8WMij8KnxbX6iRDY2@lists.infradead.org
X-Gm-Message-State: AFuF++lPIbGM1pzfhV9O5deJcMXUuEa6/bs9yktmSGKoszjnQUkDBdYV
	3skbE9byx+S6K66YDfLosF0Zg1Wnve+SPjwTd6/56EL+culMnYQ7R3MGgV3IKNOVYxr3yCxsGI+
	FwJDsxBaNNeGSbtFkzndsE+LFURTCLwA=
X-Gm-Gg: AYBFou2VHwBS6YSxCjD3n95W1SQCXm1S/m9Mnz1uJgrooODWHV/rebwK+aR8Rp0fIZF
	WEsLL7jvMdRoRz9RJyJdflbn0mQINL4TH0SWA86WTHLKC6IecRYURCYZ/JsvFuDQ5onaeFpO4cp
	4rmm8bvvRdrpE5fGoodWLMMb8Kby7qhkkk1pEUBWgjSFWsqzjXHzZwyCg+p4oQ1XmGbfWlQsNnt
	5GoBj1IRZtZbZGutULqjA7zOM/qL1AE1ErD2s+mWX7B9+HJ/rAAyzJ733vDE0Vrn/Qvzav5Qu7t
	ua6NmNI82ZYnwDg8gtW7h9zO+9SQe9c4M4QZ0A/+Shb7hZOj9S5jIXRY0JDpsHLYCYxCrQ3nuPw
	yKnJLp1uU0ghP+VgRcw4K1Ug3d2Y2OF5YqnmTBX93RvYO1/rG2nGFECS0zTx7pYcI8mo=
X-Received: by 2002:a17:903:2451:b0:2db:7269:38ef with SMTP id
 d9443c01a7336-2dd2a3362camr50043605ad.14.1789103652898; Thu, 10 Sep 2026
 22:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260810093112.47807-1-phucduc.bui@gmail.com> <20260810093112.47807-2-phucduc.bui@gmail.com>
 <2026091054-preflight-capacity-e7e2@gregkh>
In-Reply-To: <2026091054-preflight-capacity-e7e2@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 12:14:01 +0700
X-Gm-Features: AcwNN1U4E0obWJZ95GdL5H5vM5ixf2nzVS2DjnR9WxfFgAkwdtRnN-OtjhWnZCA
Message-ID: <CAABR9nGc+ERL_AenTWzHZwxUeRB4KqyvMB5REOgGzko7X-+p8w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_221413_991083_48EA744C 
X-CRM114-Status: UNSURE (   8.52  )
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

Hi Greg,

Thanks for letting me know.

>
> This patch did not apply, please rebase and resend.
>

I have rebased the patch and resent it here:

https://lore.kernel.org/all/20260911051043.15962-1-phucduc.bui@gmail.com/

Best regards,
Phuc

