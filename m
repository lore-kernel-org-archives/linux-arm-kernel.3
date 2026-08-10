Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA87C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPOZDjm0qicPVxcdpi6ugyNcGwoCVz6o/jhlFg1DkwA=; b=ZwtHO8KuRqEyBQ3NAnB8MDnjn8
	sm/VxDd6PekGdGsrN87rTb61sit+n3gjs3TiQRX9iuIn21iEGEZ73waSjwjSPAu8+9Uy8xY12eHED
	r3rX4OuzEIAlna6zM9N0gF0M/429gsIHcv+twQHWip8Ov5VgA3AhkvsTs6UMVmpRmXtBhBDzjr4cK
	o686bn0pHVtf3j9WgSCubQfog/p4KzX5o3ECG91wdT9yz3qVQJTulYI/2L9e7UvKslwTnKwmLQKmj
	EW/lzoNOCbFRQklgPPHqn0+iAIKxm+GRm5BEg5dX46XkoS7uCLM7fa6kgQU6e4ML3s0deD3A2qZ+J
	j0RPiXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSjO-0000000CMzP-2CuX;
	Mon, 10 Aug 2026 16:20:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSjN-0000000CMyz-1Zdi;
	Mon, 10 Aug 2026 16:20:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94FE160052;
	Mon, 10 Aug 2026 16:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87551F000E9;
	Mon, 10 Aug 2026 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378804;
	bh=RPOZDjm0qicPVxcdpi6ugyNcGwoCVz6o/jhlFg1DkwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cTNv9jC/aG9GpEcPuG/S5rsnSC9CG7OLShcGUUGf2DothJRSHWvCP/+upsSE3l9WG
	 f0woCzDd/0kF6hE8tAo2g7pqiAK8eukZm/KrEr66NptSJIUaJ0Rb4fwSDfYyn8HiW3
	 HGf1yCCsfDutQZ/ziT3ziWsbFK170iLWcCL9BfNfeuy+wcAcURn2mRN1yeZg9hzTGc
	 pjjz1Ip9lIEZQMpupAP2tKSo3rmBjEW7N/YIIDMV2dUIXvbQElP5QNDu1wCIQZwMeP
	 9SdjsXJFS1ErWospxII5r6xeT3+s9QIbquSzf2G/Y2uLxK0jPOyY8LApKOpWoD+QBM
	 uwclds2+gi4Uw==
Date: Mon, 10 Aug 2026 18:19:52 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alan Stern <stern@rowland.harvard.edu>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v7 03/16] power: sequencing: Add pwrseq_get_state()
Message-ID: <5kvmepqjoeh4igu3q3xovgimqunz4e6z3h35gqq6p2runsab5c@an2sg7ltp4p4>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724084328.3943997-4-wenst@chromium.org>
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

On Fri, Jul 24, 2026 at 04:43:12PM +0800, Chen-Yu Tsai wrote:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_get_state()
> so that they don't have to reimplement it locally.
> 
> Instead of just on/off and error codes, the function can also return

'can' -> in the future? I don't see a value in adding it, but not a concern.

> "unknown" state. This is in anticipation for "uncontrollable" power
> sequencers (such as GPIOs left unconnected).
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

