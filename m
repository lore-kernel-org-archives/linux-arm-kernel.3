Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771DBCDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kyjn1XSSFV58s+xzTe6JzUKJQyHLDtnE8CF0wlcJZv4=; b=bJYBxGix/KQ2HpP0lvASfb4JlD
	/OVPXoAm0MRd5Sr8mE/FcaVMg0l0oZDvhQx+/1lvtUlGagoN0vzOekq9OfiWlLq+VsweJShg5N3+o
	2bH3mRs4XnvkzSJsX0p6XTprqt7pV3gZxLEpmwsYQSSVHXrel+sTY2PzPqFGF/b2beDMiUNTe9pIO
	dcKDp4UCaERhgWYn8C6UG8cmZaXtMESLGnLSwjgA4dyYN3zit/ti2Lkju3TsF6+AuCn3b6Vjhib/G
	+k6YT6sQFt4AsvvbB+7BCLlmYMqXFaiQnO5YZR96yZ2qzv92XTjGDr1cxkZbIGIjtUlw5LKfysSVy
	30saj6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco7c-00000009cb0-1q5l;
	Thu, 25 Jun 2026 17:44:16 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco7a-00000009caU-0xMJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 17:44:15 +0000
Received: from DairyQueen (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9E9C020B7169;
	Thu, 25 Jun 2026 10:44:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9E9C020B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782409449;
	bh=Kyjn1XSSFV58s+xzTe6JzUKJQyHLDtnE8CF0wlcJZv4=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
	b=VCooPUmwR/wlrM2n6KX/vnrc83rJeGIC/OlIu/bNZ+mxcX9vX4C0BkVWWe/l5FcFz
	 dzRI9NJWTfCx8eCjt7Sk/EUiLvqOtyf5E2zCLdcVuIJDi3nlfjQ/pw0LYseh5rnOUf
	 etjYJztVs+bKPWObYamRLHTgwhkaBtpqkpMIDCcs=
From: "Kameron Carr" <kameroncarr@linux.microsoft.com>
To: "'Michael Kelley'" <mhklinux@outlook.com>
Cc: <catalin.marinas@arm.com>,
	<will@kernel.org>,
	<mark.rutland@arm.com>,
	<lpieralisi@kernel.org>,
	<sudeep.holla@kernel.org>,
	<arnd@arndb.de>,
	<thuth@redhat.com>,
	<linux-hyperv@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>,
	<kys@microsoft.com>,
	<haiyangz@microsoft.com>,
	<wei.liu@kernel.org>,
	<decui@microsoft.com>,
	<longli@microsoft.com>
References: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com> <20260609181030.2378391-2-kameroncarr@linux.microsoft.com> <SN6PR02MB4157C9AA6BA2DD14E7697F2BD4E32@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4157C9AA6BA2DD14E7697F2BD4E32@SN6PR02MB4157.namprd02.prod.outlook.com>
Subject: RE: [RFC PATCH 1/6] arm64: rsi: Add RSI host call structure and helper function
Date: Thu, 25 Jun 2026 10:44:04 -0700
Message-ID: <001901dd04ca$3d2d3260$b7879720$@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIqsf51yBS/Or0EhgWD9giRtIuOSwGQcImIAlNLHk21lRJa8A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_104414_318222_DF5473CD 
X-CRM114-Status: GOOD (  12.09  )
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

On Thursday, June 18, 2026 10:46 AM, Michael Kelley wrote:
> From: Kameron Carr <kameroncarr@linux.microsoft.com> Sent: Tuesday, June
> 9, 2026 11:10 AM
> > diff --git a/arch/arm64/include/asm/rsi_smc.h
> b/arch/arm64/include/asm/rsi_smc.h
> > index e19253f96c940..ffea93340ed7f 100644
> > --- a/arch/arm64/include/asm/rsi_smc.h
> > +++ b/arch/arm64/include/asm/rsi_smc.h
> > @@ -142,6 +142,12 @@ struct realm_config {
> >  	 */
> >  } __aligned(0x1000);
> >
> > +struct rsi_host_call {
> > +	u16 immediate;
> 
> I don't see the "immediate" used anywhere in this patch set.
> Is it always zero for the Hyper-V use cases?  Just curious ...

Yes, the immediate value is always zero for Hyper-V host calls.

-- Kameron


