Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CC9C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0SsGMDsIhNDXgsDJppjL0ICttRNdOjHbSPpWqlls1U=; b=Krx/XeBxzjU5uFoqFYIzde2N6h
	+9nOhhE4ZOKsMxKQK+LS7P2FVdHnezg3Oh8oyO+gmHvo20AgdI27hU1u+cnW6HKDDJq9KWUOKQosq
	Y5xSokHtzZfwIwqVdlEiXxRXpVIqupbSHMs//OEGDj22xYGcC7sijETcYKMMU9KVI1x0a84RK/7IP
	Hkf1AD+3ud4nvhlQ+YBzBFyshRfkLDcWpoEp/UK/er9oy6j84ZejQHawdamO7QeP2jC74Kb5theIl
	YdihFz2Ev57x3wRj4zduRRBmtJSFg4s6jIbtjRWcaoBb6YS+j2E/p6nU21Z8ognokmfQyQVk3mSih
	1MRj6lRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQtF-00000005i3r-2ZCe;
	Wed, 26 Feb 2025 23:32:33 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQpr-00000005hje-0Izu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:29:04 +0000
Received: from skinsburskii. (unknown [20.236.10.120])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5E4C9210EAD1;
	Wed, 26 Feb 2025 15:29:01 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5E4C9210EAD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740612542;
	bh=Y0SsGMDsIhNDXgsDJppjL0ICttRNdOjHbSPpWqlls1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmqI5Pz0oEMAIA12UXnqbyiy7Ln7sN8zNhFjlNh1Jd0VqKfr+zNRoK2jESW3nLrrR
	 TdYuwJe6C9jrFV5Mb/9H33kKo5TA0QSCw9d1I3u2qBBv15WghFf/at7PrXMINvnpD/
	 3UXqj/2VmIAoRa0X+9QkCRMIoECSdSGtxXoXjJR4=
Date: Wed, 26 Feb 2025 15:28:59 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com, apais@linux.microsoft.com,
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org, vkuznets@redhat.com,
	prapal@linux.microsoft.com, muislam@microsoft.com,
	anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v5 04/10] hyperv: Introduce hv_recommend_using_aeoi()
Message-ID: <Z7-juyZW4q9PsQ5V@skinsburskii.>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-5-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740611284-27506-5-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_152903_133109_328727BE 
X-CRM114-Status: UNSURE (   5.89  )
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

On Wed, Feb 26, 2025 at 03:07:58PM -0800, Nuno Das Neves wrote:
> Factor out the check for enabling auto eoi, to be reused in root
> partition code.
> 

Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

