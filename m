Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C4BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4W08pkcgrvErlvKltzQfijSatxb7EhxkJwPBhCDZJW4=; b=KG8sEeWcW3cYzxfX1PZbKCm4YT
	lcCPQadZTkUY++Rsy0YnXhLiNP3yiDTHllaAaGDBLwFFg5v8w+RtYd0qWsYtEgnpKIt+nEGXQFR4S
	u5f8ylpMvIomAjcyOsFDm3bnlde2btfN8ztltq8mKn7Sf3OuLWcTi7VhVTB+q2qbkfxrzUqaDQfGp
	4ev14g0AFphN+k309pcYX3Kg+PiH/37dlWQ+NCAA8HhP1Rz2gZWWlTyAQQFhTasKLX0qK7Ko0aIOh
	H33QzlfSJPnr1l3wQmuH3n/2Fu3s+fQgVCoLuP+7dwoXhvxosbRv49RpBi1/iQdHGwm4UPNwtgLTS
	x9WO0PBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrPx-00000009YgD-0vms;
	Mon, 03 Nov 2025 10:04:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrPu-00000009Yff-011l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:04:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEB1040B1D;
	Mon,  3 Nov 2025 10:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27298C4CEFD;
	Mon,  3 Nov 2025 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164240;
	bh=9RzhQqecN6YFsQXxZsZSBnwAFeaFnaljJyT67SZFxMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFM/2cKZiOYPgwzPgB45BzAPDDsYfilXWPvAgYafNmVfx7KeFC+R7U67qSY64knv2
	 E0sRkiZ1NYNk/cCHmB5wQHg1YmfX98q7ZnxokhZenMFarmsorzV1LTt+dkxHdaj2Pi
	 v/8b/EEjuQBfUxp2wRX4LHctWKzSYK2auuY3gdg+9U1OcI7gZ4m5j66S8AR6fP9Bb7
	 5IMgdvv6iZPfzQPQ4vqBsmDygl7ZDGDAZxtmAdDA47AW3Td2iC7zthxn6jEeVgBmqD
	 cmt1Ha+3SMcZDPPb0NUa4Jf+70ofWI2sxKr1MO5+QiXoWNjgFSLci5i70qbMguQk0W
	 qmLov/yZ5sI2A==
Date: Mon, 3 Nov 2025 11:03:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] soc: samsung: exynos-chipid: use heap allocated
 driver data
Message-ID: <20251103-sassy-flashy-panther-6b9b42@kuoka>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-3-d78d1076b210@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-gs101-chipid-v1-3-d78d1076b210@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_020402_080994_91A6A0DC 
X-CRM114-Status: UNSURE (   9.61  )
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

On Fri, Oct 31, 2025 at 12:56:02PM +0000, Tudor Ambarus wrote:
> Prepare for GS101 chipid addition, it will requre more driver data. Use
> heap allocated driver data, it's easily extensible. Together with

Moving from stack to heap does not give you "extensibility". It is
extensible in current form as well. It allows to use it past probe,
which probably is what you wanted for some reason.

> the change s/soc_info/exynos_chipid, it better indicates that it is the
> driver data structure.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Best regards,
Krzysztof


