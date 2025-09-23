Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58BBCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmLDLSUhIgyW2E8XpVDH7PtXAL41rLjhjSwjbacf3Jw=; b=QGNqDlw1bTHLl9Khlkfhjp4Nyq
	+gFHyKA9LFG3Ux3Uy/Pk6A8vpKeddMUC/gitg47K+C+5UFca8FcRKjpZd1j5iiQRNJl5c3NSvpczr
	qhgq+7czd7S8PGchR/htCa91AkvrQAjBWYfxxQK69ohe8QP1DG4sM5TLvkA1G35GiLpDzddKbMrUD
	VAt9Dd7tD3zThc46VjImRfaOHGGSnLSJO99pEFVX+HRu3Cun9ZhlEWJItePxMkNIRNcEN/qXFQK80
	Ts7EaY+dUEW9kMFCyf00IFkL5no9gV/EqdVOteeC6e+w35SmdeNoby7enYJ6a8lPh7eKRcZBIsvbb
	4TGXXHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zow-0000000D0Z9-3laF;
	Tue, 23 Sep 2025 10:00:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zot-0000000D0Yo-47iY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 10:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6D4943A3F;
	Tue, 23 Sep 2025 10:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E520C4CEF5;
	Tue, 23 Sep 2025 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758621622;
	bh=ZmLDLSUhIgyW2E8XpVDH7PtXAL41rLjhjSwjbacf3Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YjNHRCyoSIySI2JhgkojZyWPyLtiZig84JvxQ9PEE0iM67VwKEdkxgjrz7Sl+LLTA
	 oNbfPYeLB/6BqR03oGyAlFOH5iTo3mngIYeR6I3Wcl1O3m8ZX5Jt99G0GOXCaA/lZa
	 IA+9u5g6CggSnHPVLE77lZXdPpsEf8RKY8tkiF537g1CcQNhN//sk5kmD643Rb5ouQ
	 pFL1yRhqCWOOeYRpt+174zdvVW+SenPm+0C5FrxfnJGC6JS0UmUlf6tH8V2tVXZvDe
	 gHgZ9GjdWr8a8pePNZSPrAuKti1KPLl84otJjeXKoRT/6XMjwrKunapbB0cx5X70+V
	 7VzrsPInmPLng==
Date: Tue, 23 Sep 2025 11:00:16 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v3 00/26] genirq: Add support for percpu_devid IRQ
 affinity
Message-ID: <aNJvsJOZHD87WTx4@willie-the-truck>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_030024_347277_B256A94D 
X-CRM114-Status: GOOD (  12.59  )
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

Hi Marc,

On Mon, Sep 22, 2025 at 09:28:07AM +0100, Marc Zyngier wrote:
> This is the third version of this series, originally posted at [1],
> which aims at allowing percpu_devid interrupt requests on the basis of
> an affinity mask. See the original submission for the details of why
> this is a desirable outcome.

FWIW, I backported this to 6.12 and tested it on a DT-based Android
device with heterogeneous PMUs and pNMI enabled. Perf appears to work
correctly, the pNMIs are configured as expected and the affinities
all look good to me.

Tested-by: Will Deacon <will@kernel.org>

Will

