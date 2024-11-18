Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53710D591AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVBaAoe5x3HLLMBRC4os5GnvajZ58Qlvy6tcTuD1j/Q=; b=GMIpuSfnGwY+9t7SoACdXzXUL8
	321+NuWolx+VosiIda3GnytI48xiqtCZovCDOauCJu+QuGbU8cc0436BTGZLPHlkhS8n3GD6gc9br
	cAfBzsjT8+E3I9BkZG3t19MFCE8IKd2dv4qJTMl5XK7pCOF5xBvta+lC9H/V9kvTH8Pdm5mZLLTVA
	NdcOQZtgDNoprJ1qSOEJ8kXSaBtI1H3VeS7LF/oAeVIgUjBBejj8sLHSnh4yeDiyu916ydfmJFx0C
	1GmCPBoqI5I4eeqwX1p7943KvyKrXM9tOSRVrm6hs/gzouFOQFB4TMTD0TVW92FXUh3cOQIBbB8g0
	CscKXtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD6ZU-0000000AM8y-2zKM;
	Mon, 18 Nov 2024 18:34:00 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD6YZ-0000000AM1l-17qK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 18:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1731954781;
	bh=vABaQHltdx3jgRYXQyVoHdcwpcwDsu4UKSsK+/mK9OY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LKt38qr4UgPp504lHzG9BImmpehcu7oT4tlmhYqlIrjgeaS16zE5oubUp9SJSTdxA
	 F0f5ozNhlf2/3Vw90tz4ISLXJH3BlvzNFPiKqKAgOTVuuEQob/qIT7k8eQA458g9Ue
	 gaOSD1IXHyhCM3UQHmJ65BLWe2k/gV7y0yJfWaxI=
Received: by gentwo.org (Postfix, from userid 1003)
	id 7BAB4401EF; Mon, 18 Nov 2024 10:33:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 7A456401EB;
	Mon, 18 Nov 2024 10:33:01 -0800 (PST)
Date: Mon, 18 Nov 2024 10:33:01 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yang Shi <yang@os.amperecomputing.com>
cc: catalin.marinas@arm.com, will@kernel.org, scott@os.amperecomputing.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: cpufeature: workaround AmpereOne FEAT_BBM
 level 2
In-Reply-To: <20241118181711.962576-4-yang@os.amperecomputing.com>
Message-ID: <1a9c94ff-fad5-3440-705b-d8dc0c0b39b5@gentwo.org>
References: <20241118181711.962576-1-yang@os.amperecomputing.com> <20241118181711.962576-4-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_103303_346566_3D607F0F 
X-CRM114-Status: UNSURE (   9.62  )
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

On Mon, 18 Nov 2024, Yang Shi wrote:

> FEAT_BBM level 2 is not advertised on AmpereOne because of a bug when
> collapsing stage 2 mappings from smaller to larger translations.  That
> doesn't impact splitting stage 1 mappings (whether stage 2 is enabled or
> not), so workaround it by detecting CPUID.


Would be better to have a bblmv2_split_available() function that only
checks for the splitting capability.

If more code is added that uses the so far unused collapsing features
also included in the BBML2 feature set then that will break on AmpereOne.

bbml2_split_available() could call bbml2_available() and check the ampere
errata when false.

Should work fine for now.

Reviewed-by: Christoph Lameter <cl@linux.com>

