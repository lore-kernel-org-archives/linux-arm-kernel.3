Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D9AC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rMLE9Ks3xKZGLvHLJOwbbSeZusmYtdNo4J2X7Ae99w=; b=kBwfq0C+c6AmnyQjME/m1MEiqA
	J+nm2WDtyzvHtDLvslOt0S+gJHA2lyKCLNPwcaHDaKI6J6oL+3lQC2N+CYhOIGWY90OcW6ZUQKVSQ
	uZZDsb8N3BlW4UJVxHtLOlnCWjy07Q0ZrFRn6UmP1q/4Xiu6reXcRY0jaGTsRlkNhf+7RLEoTqWnS
	uRNJIitvF8uhxBYA28XLcR4wPNkfPgmmZZTbDJCOcc2QYTWzatZpw1nGAMJyaxbX2ObIXhSVBxJFH
	aN9LsMa/rW9f8Hly+gCDLWmosNq3q0T4XLBUOQ3YXhoTk6O4p6QCc85GHZhqsDyKbXLSAQ5T2PwkW
	vS2LzAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokMS-00000005moO-2ONk;
	Tue, 28 Jul 2026 16:08:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokMQ-00000005mo2-474p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 16:08:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB2BD43B0E;
	Tue, 28 Jul 2026 16:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4231F000E9;
	Tue, 28 Jul 2026 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254934;
	bh=3rMLE9Ks3xKZGLvHLJOwbbSeZusmYtdNo4J2X7Ae99w=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=KaDZ3BwAW4LRjXuA5Y3LYSj25FKyyakNgjXE1BAnM1eZVhB4I05LaBGhXR6arGk+h
	 K1vSLiXLiAXeVrxHRnfYm0l6VJuTzASPxcMfX5nXsQb2KPVvDd6VwiQtUCs1jqhG++
	 bh3mZGmIZAEb6nsHl5mqTHwfwEF3QaQD0pTisuX4/NpfpyIwX9WmdAVLVzL73tIsgI
	 513t7+SwQjbkxYr+m/UK2cTxlxnf0m5gawHAwEp1n3d7CDdXZGET+wQPRc/ThRgbdy
	 S9TuvF8/GYxogNzx0tpvS9VeNgN6623Ar9DrWl9Cs7l7+hzKXVaojhw2Bk+X3zjcch
	 qSqNR3g7ecsLw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 18:08:50 +0200
Message-Id: <DKAC20YQ9T1Z.3NEEFHM908430@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, "Hanjun Guo" <guohanjun@huawei.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon"
 <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Len Brown"
 <lenb@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <brgl@kernel.org>, <linux-acpi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Sudeep Holla" <sudeep.holla@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] ACPI/APMT: use platform_device_set_fwnode()
References: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com> <20260728-acpi-arm64-pdev-set-fwnode-v1-1-b5aff9b2235a@oss.qualcomm.com> <20260728-energetic-mayfly-of-chivalry-4e89d8@sudeepholla>
In-Reply-To: <20260728-energetic-mayfly-of-chivalry-4e89d8@sudeepholla>
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

On Tue Jul 28, 2026 at 5:56 PM CEST, Sudeep Holla wrote:
> I don't see platform_device_set_fwnode() in the upstream tree, is it in
> -next ? I didn't see -next tag as well.

It should be contained in linux-next through driver-core-next.

