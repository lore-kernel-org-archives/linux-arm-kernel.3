Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824A2CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3cTE6CEeaVLSbJBCMPs3juqjM+llsV1pDj+h29WtkM=; b=b8GJWounnQ3M3//qPBhilwnLBO
	bloM2fK74eAkr5DTnO6uIl48+NMXIctUoO5HFd5A8MgCqCn6XQ0JOngAuLThyaZvfclodUOT6rJEB
	qMVXuNIG4IMszuHg0saF41EudCw6LygqX5UILsWTDTKMHli38SxwZjD3YNq0N90pdCwl9jnlVHdtY
	g8omQ+B9DUixI85q5VbKIVTCXVL9KuQ6OTtB/MmYrkSA3NEq6aTYB54WrTEK6RFbg7FaG90ZbEz27
	JJajimQmiVn/lx7I8nw1xKpQzEAjoTsdC//eU0+rLeeid4hjvW3tjD8OR1a3CpmCeF4+PtMINHejY
	fID6QENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvJF-0000000HWek-46KD;
	Tue, 06 Oct 2026 02:53:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvJE-0000000HWec-28Bt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 02:53:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CBD5440D3F;
	Tue,  6 Oct 2026 02:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E6D1F000FF;
	Tue,  6 Oct 2026 02:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791255219;
	bh=V3cTE6CEeaVLSbJBCMPs3juqjM+llsV1pDj+h29WtkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C3b/+E90+51wgBgIZ63YKbOX5mfjNH4e57ru9piCUPJA0hGhgxUykIJlp8rX+I5XE
	 WH4p7ElVlUZIvYV+rH/J3LJ5D7JDDVui9cUV0SH+pSXpAsHhQHNbgPE8OWW1pXhf0h
	 NA70BPbjOWlMl6MfCkouD/F3l70f50mf0qgawKTq9FNERZvKFj0psyGCZaSA0Gfkti
	 MWZQx1OVSWeONbqoYPqm526aiTTlxxpzw2h1tNIdjz3kW9qCTQSKsAabP/6Yu5f1v3
	 Zy/vPwSdKkXvZzZhMbLvsuI1SKo1ZB/b8ChaX43kKEuij0erQVLuWEYTKSvqAJS2FW
	 V4E2BSkf09wUg==
Date: Mon, 5 Oct 2026 21:53:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Moritz Fischer <moritz.fischer@ettus.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Andy Yan <andyshrk@163.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v26 05/10] dt-bindings: arm: Document reboot mode magic
Message-ID: <179125521832.3448223.14726360710255018567.robh@kernel.org>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-5-b24e2348e8e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-5-b24e2348e8e1@oss.qualcomm.com>
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


On Mon, 28 Sep 2026 11:39:17 +0530, Shivendra Pratap wrote:
> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 56 +++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


