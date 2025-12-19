Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AAED78785
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxCWED1lQ3xQHAfEzdEfYQo+mnCg8pklLKYy52Nrj2g=; b=AQzo7WxVICSoGDHTv0zFZuMlXz
	jaRHp6J8aiau0/FDojxpZv8zDRxpjQecicN8EV2nLJYt/ohJ5oZ16stnNCC5uaTyiEWjaddWulY5Y
	3YMQoUMP9NgtFIySx44ermE8p1j+Tisn755Cypu3SOyi1lwVwTGEeqp25HqURfXhvPgk6lp9zQyiJ
	zNfd6cy+S0HdRwuT+I4ZWLbJg6FgdG9JVQBCvyBRXGLnsAT3CGXlXzbsTHKgDeFxbvg4f5NiKU+rZ
	UqW5ardht7Q7a2TxC2rEUuDspL/rYDdrMgmXs4H71vhi+umOIzzwdzdVLe8VHFcweXOXBxBgiuHo7
	CE91zZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbno-0000000ASBo-1WyT;
	Fri, 19 Dec 2025 14:49:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbnm-0000000ASB4-0ZZQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:49:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30454FEC;
	Fri, 19 Dec 2025 06:49:45 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 588433F5CA;
	Fri, 19 Dec 2025 06:49:50 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	Ahmed.Tiba@arm.com
Subject: Re: [PATCH 03/12] ras: add estatus vendor handling and processing
Date: Fri, 19 Dec 2025 14:49:02 +0000
Message-ID: <20251219144943.2798169-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218170453.23be9049@foz.lan>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064954_219318_A2E4FE36 
X-CRM114-Status: GOOD (  14.46  )
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


On Wed, Dec 18, 2025 at 05:04:53PM +0100, Mauro Carvalho Chehab wrote:

>> Teach the estatus core how to walk CPER records and expose the vendor
>> record notification path. This adds the section iteration helpers,
>> the logging helpers that mirror the GHES behaviour, and the deferred
>> work used to hand vendor GUIDs to interested drivers. No users switch
>> over yet; this simply moves the common logic out of GHES so the next
>> patches can wire it up.
>>
>> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
>
>...
>
>> +static bool estatus_handle_arm_hw_error(estatus_generic_data *gdata, int sev, bool sync)
>
> Huh?
>
> This is a CPER record from GHES. Why are you moving CPER code out
> of ghes.c, placing in a file named estatus.c? Doesn't make much
> sense on my eyes...
>
> Same applies to to other GHES CPER record types.

GHES still fills in the CPER record, but the parsing and logging logic is
shared with the new DeviceTree provider so I pulled those helpers into the
estatus core. Both providers already call into the same notifier chain and
memory-pool helpers; this patch just moves the generic CPER walking routines
next to the rest of the common code so the DT path doesn’t have to grow its
own copy. If you’d prefer a different file layout or naming to make that
intent clearer, I’m happy to adjust.


Thanks,
Ahmed

