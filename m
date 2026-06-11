Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903B6CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IU3Izek11DlTn3+eMp02gjkvoPAVU9+fiOHobFbbBk=; b=0JP2w5qB4n+Q5y7yVjpAzDnfqT
	VuQpRev/tpBHZbekPdMz54wphweeBD/5WglZG0w7m3gOqtLdMqr0HHWNga6008dqHa75T+nVjJlGA
	vzhdcUQN2pm6wPKukCilKIgFQIz/7mcfX61EP5nKAI1MsOjQahfwpWYfQAjxmwQFdhh8VG8/Hf453
	qqvZCzTJMXjTQVbsxmu4QgZZ0Kt/mlqFMG/v69j7Ezrg2H9PFhHnG7DEUO532qOsoGhLXlIuLax/G
	cXRtoHIHK/3wRDPvRatp6mHvXdZloCzhqR4JEzYWs49KZJz15jAWYqqHBoEVafkecXgZO67daXaYf
	iL9BLWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaZW-00000008ymQ-3KCA;
	Thu, 11 Jun 2026 08:15:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaZU-00000008ym2-2PsC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:15:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 06D0F44612
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AF41F008A5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165727;
	bh=3IU3Izek11DlTn3+eMp02gjkvoPAVU9+fiOHobFbbBk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=nI/avuyh3YSIOPmXXn1nMjWH5uVZJu7d3qrMRHzvD3hNAVJbywKbxH0sNOXHdMJcA
	 MXxijJQfzhFP1PaFpNUOOonu56SHOL7OHcCbUnGflcum1wXmROR6AkSoFv5san8l9/
	 GUR0uCNeb3ZWB53wyI1EvI8LXQbb/3Pp37lgxiuqK0R5qAdySknzUCJ0Cqo1H4MB2S
	 jEbBAlP+CU8Ckz9JYKQLM37OAeFGxfRQcnXFATT7EsrPPcwAM6ZZpTPdwdsB0pxedK
	 R/VqD1KtHQMdpol48+XxbfBw0dd8kHz5cJ2Qg9ak5y9Jghbo7igPlqGn8IXZSCJEvY
	 yWGQJY9yUVxOQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa63daf2a5so7589345e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 01:15:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/aiVa+YvGQo9ZZXVUBcxkfv2DFLdgpmS8kXEDVa+qO5PwVnalFOIS7jCUcgukc3BWF1rmQkq5938+0RPtqHAVr@lists.infradead.org
X-Gm-Message-State: AOJu0YxGQGqXhHRKA5a4QWPOiifyTOClxZYJ+/Fl9IREDM0DY4H2cq/v
	G6ggk20p/sQ2qylko6sl7j1e+H1O8p13Jm+YbzkBrEmIliflS0WhdFZUXuHVjLodg3BbzoT3t9Y
	t7j5VRfyR7eT6gGAYWjJ8aLSepSfhEDnUgRAb38WStA==
X-Received: by 2002:a05:6512:220b:b0:5ad:a04:e62b with SMTP id
 2adb3069b0e04-5ad27cd1f4dmr556504e87.32.1781165726578; Thu, 11 Jun 2026
 01:15:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:15:24 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:15:24 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610084053.2059858-2-wenst@chromium.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-2-wenst@chromium.org>
Date: Thu, 11 Jun 2026 04:15:24 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me0zQYLLuiyYBOtD5quL_LeK_Zg+WoL0vzXDhjB5e+gzw@mail.gmail.com>
X-Gm-Features: AVVi8CebXQLKBQMIYKPsMbHoISglCZVr32F3LvdIki_eZQgsmFxJVcEwTR4qpYo
Message-ID: <CAMRc=Me0zQYLLuiyYBOtD5quL_LeK_Zg+WoL0vzXDhjB5e+gzw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 10 Jun 2026 10:40:35 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> In some cases the driver needs a reference to the port firmware node.
> Once such case is the upcoming USB power sequencing integration. The
> USB hub port is tied to the corresponding port firmware node if it
> exists.
>
> Provide a helper for this.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

