Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51197C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYskf4Q6IOL04q9jyqtfU8Zgdvew2yriJ3Ik8GT2/Z0=; b=ezFwj5vx4KB+b7QyUFN6khqms1
	rmAImMNrGR+oQJnEPY1IfC9CVDRU0KRNanH+YU32k5f6XWaLE967tRAkqNZXkQrWQarPR0XSH+cNw
	5E5EdDmGhTpir8M5aCz1dtpnyssQdEGMZ7G+ITfjSImLezKfcPEQ+QvENy1rUnet12KcfYgQpIWIf
	rVc2IDsiaNM1hdXyff+27mvdbSVVlXRJogwjkHxG8lseeLqG9/gZE1NZJQCcRvLXE/g2oWMEylJdD
	zG1cfQC2qZ/JmqcA2pt0WRGfv1bGMHydF7l8cqEKJK6BJ1qhcEBvsOWF9r/oHFBdvGEqsQFBehBRO
	uFLrlzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnn1U-000000097ra-0DVg;
	Thu, 27 Feb 2025 23:10:32 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmzm-000000097dp-1bGO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:08:47 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5037E210EAC0;
	Thu, 27 Feb 2025 15:08:45 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5037E210EAC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740697725;
	bh=zYskf4Q6IOL04q9jyqtfU8Zgdvew2yriJ3Ik8GT2/Z0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GVDOlEPTyz3LD9fsfIPoqV+r6EmceZBi0lZLEjt/esvDYSWBzJjxwDfhA40k7eLd+
	 0K0FXz2Kavl7vHD5TLQAvsxN/qTlo/ZLEwepIXxhd+v+y1mh/0ohhhVwfX9M2yKbDK
	 HIizPi+oz4D9ih/ptnOZGFMknxlWUe66k2Iq4mt0=
Message-ID: <49a69fe3-fca5-426d-999d-61ee0c8f60f3@linux.microsoft.com>
Date: Thu, 27 Feb 2025 15:08:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] hyperv: Convert Hyper-V status codes to strings
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-2-git-send-email-nunodasneves@linux.microsoft.com>
 <74af19c4-639f-4bcc-b667-b5f102bbb312@linux.microsoft.com>
 <8338dd00-3aa4-418f-a547-1c19623358cb@linux.microsoft.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <8338dd00-3aa4-418f-a547-1c19623358cb@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_150846_445557_845CC866 
X-CRM114-Status: UNSURE (   9.78  )
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



On 2/27/2025 2:54 PM, Easwar Hariharan wrote:
[...]

> 
> Sorry, I have to disagree with this, a recent commit of mine[1] closed a WSL
> issue that was open for over 2 years for, partly, the utter uselessness of
> the hex return code of the hypercall.

Thanks for your efforts, and sorry to hear you had a frustrating
debugging experience (sounds like it).

Would be great to learn the details to understand how this function is
going to improve the situation:

1. How come the hex error code was useless, what is not matching
    anything in the Linux headers?
2. How having "Unknown" in the log can possibly be better?
3. Given that the select hv status codes and the proposed strings have
    1:1 correspondence, and there is the 1:N catch-all case for the
    "Unknown", how's that better?

> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d2138eab8cde61e0e6f62d0713e45202e8457d6d
> 
> Thanks,
> Easwar (he/him)

-- 
Thank you,
Roman


