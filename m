Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C4BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amp1CEFhaVmmxuo6v/x5I4IWHqW3oWzKuDQMVOnB5O8=; b=tIOWCDmiCnC/oUxGL8wya7L1wz
	hVMUQdZuyp3q4FRH0EwrqW3WYE9Zzkau69hl0cC/4x1Qs+18X8bU7sweV7P8J1+/xk0DsZHlTzDCs
	QEDRDoTuoQrZe/LXK+LgQcBjJHYZNlC6sM0QuUcFWXUKBCV2Bo1W3tSHkiw5aKREZyIwEhki6qAox
	DZUJkQVEsNX1yRUUpDTbhjvMc/50LWJJiiZx0q6MumtSFCeyQtLxBBpPZJQ53lLt4Q9EUy3kW0P/k
	+QH7HHR6Qm8/eHJUjTUfu820sT9r/SmgI5J5iT8uHwMtYuNIpuiGIcsghuuC/DLy0cTiz2fm0nKe4
	vAc8WbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRAO-0000000BJXh-3WrZ;
	Thu, 02 Jan 2025 19:47:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR98-0000000BIwv-28L8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 19:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87E0AA41470
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jan 2025 19:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFFEC4CEE3
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jan 2025 19:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735847177;
	bh=amp1CEFhaVmmxuo6v/x5I4IWHqW3oWzKuDQMVOnB5O8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jASbJtqrpq3wZ39VleyGGB7kavwD/fJMhO2UQBKowrcFBIS38Tj/5JiU9RIele05c
	 d5mt1Rmz1tMKB2lZiF5jADE895m7Ql3uSGs02ql6T5Vuvcadkon9hOCOloIVpmkJ/u
	 7VscVQSb0FEhNdSd75bzrxxvnErsPeycHQ2P02vEDGHBFAqt6uMzuzm2karMIqd5XJ
	 suHxf4xdzQ9vIOedy9FzTHXm0bquKKs5h/ozgYH1XcPFW7ICqA3TKACaajBQRJJ9YN
	 l6148IdBYsqUMU2dUOA0lZgR9r3t9fuau2LhPPKPNS2wiFrBNvXGLu589/6nCd4Ymq
	 sxHHkKTzkW55g==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e39f43344c5so14637338276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 11:46:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgBlufVAVADfiJ4LQ8xa2PNlwbtbQ7XvJPemuPh0WWKsEL8PgCKIbKDV1/5S+KzU2oODIa33AzldSk7TWbDbgH@lists.infradead.org
X-Gm-Message-State: AOJu0YyNqJFOHG1T7B7I/0LYW7zEGxKu2HDtpZWvGVgfr8tTqJC/nK8w
	d4Ng7/wVtu88U+3ySERAk6s6qICKV2GtmnWle4KffPRj9klYF2bC6/DIOOkwtSenI/38xWfFvoJ
	NeuTfHCgyFmowUE56nRhIFHmWeA==
X-Google-Smtp-Source: AGHT+IHJkV6/Tz0b+/BQUDZk6POaQoSuO0IHC+p3oeSsJZMQ51uLdt7IApHJfEWtHbNKSAJno7pQz5oonaXJyVTLq/M=
X-Received: by 2002:a05:690c:d88:b0:6ef:5c57:931 with SMTP id
 00721157ae682-6f3f81029femr273206797b3.10.1735847176306; Thu, 02 Jan 2025
 11:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20241109094623.37518-1-linux@fw-web.de> <20241109094623.37518-2-linux@fw-web.de>
 <20241111203611.GB1887580-robh@kernel.org> <trinity-796b046d-1857-413e-bb82-78e700d6b5ac-1733138371404@msvc-mesg-gmx005>
 <trinity-a84b41b3-79c5-49b5-9786-eb89f85578cc-1735843472332@trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9>
In-Reply-To: <trinity-a84b41b3-79c5-49b5-9786-eb89f85578cc-1735843472332@trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9>
From: Rob Herring <robh@kernel.org>
Date: Thu, 2 Jan 2025 13:46:05 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+PEdH1b-aoN2nFJMRz--abXPqZ=sftPnhYKWpj0VjroQ@mail.gmail.com>
Message-ID: <CAL_Jsq+PEdH1b-aoN2nFJMRz--abXPqZ=sftPnhYKWpj0VjroQ@mail.gmail.com>
Subject: Re: Aw: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditional failed
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux@fw-web.de, dlemoal@kernel.org, cassel@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, hdegoede@redhat.com, 
	axboe@kernel.dk, linux-ide@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_114618_622032_340DA73D 
X-CRM114-Status: GOOD (  11.38  )
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

On Thu, Jan 2, 2025 at 12:44=E2=80=AFPM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> is there any new state here? got no answer for my last 2 Messages
>
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2024110909462=
3.37518-2-linux@fw-web.de/
>
> sorry for the html-entities...they came from my gmx webmailer, it is repo=
rted multiple times, but i cannot do more here :(

As a maintainer, when I see any discussion or comments, I drop the
patch from my queue. That may have happened here. It is best to resend
if it's been more than 2 weeks. Though Marvell maintainer response
times are often longer than that sadly.

You haven't addressed my comment either. The subject needs work. If
you don't like my suggestion, then come up with your own.

Rob

