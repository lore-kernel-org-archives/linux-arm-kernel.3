Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D9AC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 22:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ji4Kvu7LpQqhECYZ1pmgrD7b9aAuvcEK2ZryUdGXyQE=; b=W1tpnLM1EBhKGSqZPADZg+T9s/
	LHvAYW+YgPO43ASdv039+I3ejm36bjiPuq6wfbyD0PGeI6vY77a4KIIeUAHZKU/GGzh7fTEgULOTn
	Sj3Mo4+XVISNQcwKflTlq2wW6F37MTPxW2Htq1MdAckMzVLfm4y4m6ytCv8to4Fm4jFeoovhbZ2Qz
	Cuk6aBJW3YGRfzEZGc7iii+QyfDmVT32QR+7g8WrhvPYSYBLjiEFCrnn3pJ1Y/uJnwo8NHfk3VWn4
	/59CyTVHcT+H1R6kKkmPWTw08czndTOSvNZ6B1mgwcOrG1RiPaSE73qNdyg/JUczbz1D6saIe+iNQ
	g4qY0CmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hlI-00000007oHF-1vH0;
	Mon, 07 Sep 2026 22:24:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hlG-00000007oH9-3Xhv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 22:24:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBA18601DE;
	Mon,  7 Sep 2026 22:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315A11F00A3A;
	Mon,  7 Sep 2026 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788819861;
	bh=Ji4Kvu7LpQqhECYZ1pmgrD7b9aAuvcEK2ZryUdGXyQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jWbFJ4K7m6sh97A0VyTs+bdWzlhd15mB1KnG6i9jInZw/uY1abiISWLt7fsSjdlR4
	 c+hLE3XzZHRZID4X84TFLpkV6hoBCSPsapuzEJW5ZagNAs2Dr7mFdtRQPm1SKixdb2
	 4/d8zwybENmG3Fg4vVcSI4F+qSXousnmwa5RmHnTona09JHTCsCUOlkYPuEq3mlkvk
	 gsp9iCW2nRQZtFr0HEuwZu+WRugX/IsPhcOKwDnvfqWPkq4BSFFi4phfhGFUDiVIJC
	 Kt85rAMfVomYOfvfvr+Sv8B4eeyxzNqHfpD8bO65uQD2CxjXhZD4kdaQgvRSVU6t2c
	 FD7Wv0NCGu11w==
Date: Mon, 7 Sep 2026 23:24:16 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Yushan Wang <wangyushan12@huawei.com>, Jijie Shao
 <shaojijie@huawei.com>, Khuong Dinh <khuong@os.amperecomputing.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 driver-core@lists.linux.dev
Subject: Re: [PATCH v2 2/3] drivers: perf: Use __DEVICE_ATTR() macro to
 initialize dev_ext_attribute
Message-ID: <20260907232416.4b0fb386@jic23-huawei>
In-Reply-To: <20260907-sysfs-const-attr-dev_ext_attr-v2-2-bf53afe57071@weissschuh.net>
References: <20260907-sysfs-const-attr-dev_ext_attr-v2-0-bf53afe57071@weissschuh.net>
	<20260907-sysfs-const-attr-dev_ext_attr-v2-2-bf53afe57071@weissschuh.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Mon, 07 Sep 2026 07:45:02 +0200
Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:

> The upcoming constification of the device_show_*() callback
> signatures requires the users to handle the transition automatically.
>=20
> Switch to the __DEVICE_ATTR() macro which can do this.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> #for cxl_pmu

