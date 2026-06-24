Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77119CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 22:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40fozanXZAxdlzneNHkPG5prWoWrnHjv4DK5nYpBKP8=; b=fnwgvE/xTPL/CynzFGJv/w5pf1
	zzEoY+E3IfIF4TFiKt3U7YzR/VXhfzsuRByzcQqXX6uekl1X5AMhutQL8lhN/1YhV6dMBEMNEyO11
	78xIdFWRUBzwCgrAw3ncRJfShxiD6UD1J7zyeKP8I4h9niMJbm7jPeq57Ia401Ee6EZ3OhAySix66
	D4Kv5LU2bdwV48+Ar8imPe9spyeyuLUvbpE15YVco/6JMlp1/A4/E7oz3hoQ9/75hXaIMfCXGvuWE
	eX8xPrhbaFWm0EEVaRCm9V9Jn7gc7DswSExF2CgMD/0oBpV2XJ3hrfaGKtr1Grv66mBNyksxclO6R
	jFmLnKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWDR-00000008P7S-3Bqa;
	Wed, 24 Jun 2026 22:37:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWDQ-00000008P7H-1HGD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 22:37:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C51460018
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3B51F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782340623;
	bh=40fozanXZAxdlzneNHkPG5prWoWrnHjv4DK5nYpBKP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c9LrCAKfczx72V/MNASmoT5/6LNaegoXFkGVJRI3xEjWqoZyGaf/QtqTQO1Dg9OK8
	 SZDkLNrsnnBP6/xrg2Y5VPu9H3cUDZFaX1ZzxS/IVmRispdlhxltPUNV5BPaeUsgmO
	 PrifS9IeGeM6LYdqLkoLH/HQcgGGdNMClTqEvLTpPOA7KFOqQH8XACo4/BZtYeiH78
	 iG12/tq7f50dqAWTDJ6GuJp6z8f6wiho6xoBkYwH3jOZ1ZodOo0vD4SzSgiOO5umwO
	 XmZx5wAdupDfEYov1Q4QgnHv4T4f91XN0hREiY4THNdSFrU3rHW9njyCivR0NtQ7n3
	 E4iu/VIQZJgzg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ad4ee80f65so1434105e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 15:37:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rorn5vhmlFOx1gYBjKY7jDCE49drb0wnFA4YZrRtMgK5bHm5aKtMMw9FXJr+wHC/0wyns/EoaFh0H/Bn8AcBx2U@lists.infradead.org
X-Gm-Message-State: AOJu0YxpXHeBWrA9saS/zX2qcfg+UsbDkTiHGxjL4o0wscaPolzlkJQq
	XndsitjFTuMtqn8NgUEhcaPgtkPMTdOM72ppAykd2KOZUqvfDUk3MmNGvHAIa6Wsu54ZuJNRjAN
	nE4lpTKoi/6l3yM7F6WojtVzq4zCxKbI=
X-Received: by 2002:a05:6512:1352:b0:5aa:8824:1571 with SMTP id
 2adb3069b0e04-5aea1f5749dmr1552e87.49.1782340621797; Wed, 24 Jun 2026
 15:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com> <20260623-i2c-fault-reporting-v1-2-6db1a8aabf18@mobileye.com>
In-Reply-To: <20260623-i2c-fault-reporting-v1-2-6db1a8aabf18@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 00:36:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLmqtG-j=Q-Ctr-1-GKVqYzcwOwWUF6AYHcKf5aXUSKE5A@mail.gmail.com>
X-Gm-Features: AVVi8CdKE0_TO6Y_h9SxJOdr6PO6E18SEZGrX_NJeddyc2ji01Fy-uaf4cY0jbo
Message-ID: <CAD++jLmqtG-j=Q-Ctr-1-GKVqYzcwOwWUF6AYHcKf5aXUSKE5A@mail.gmail.com>
Subject: Re: [PATCH 2/7] i2c: nomadik: optimize layout of struct nmk_i2c_dev
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Dmitry,

thanks for your patch!

Also nice to see some kernel contributions directly from
MobilEye!

On Tue, Jun 23, 2026 at 6:32=E2=80=AFPM Dmitry Guzman
<Dmitry.Guzman@mobileye.com> wrote:

> Put two bool variables `xfer_done` and `has_32b_bus` and two char
> variables `tft` and `rft` together in order to reduce struct size
> wasted for padding.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
(...)
>  struct nmk_i2c_dev {
>         struct i2c_vendor_data          *vendor;
> @@ -206,13 +206,13 @@ struct nmk_i2c_dev {
>         u32                             clk_freq;
>         unsigned char                   tft;
>         unsigned char                   rft;

^
Maybe you want to take the opportunity to change these
two into u8 if you're anyway changing the layout of this
struct?

Either way:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

