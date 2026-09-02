Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D70FC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVkVuPhoPxzk6Z94L3N0Zj2zqqxuaLOIcq/Bx7B8iNM=; b=LIPounJq+l8oZXuKeezTh3HpsV
	eQnN2NxVWnkVRDXEKHNu9M2qRuADGBPKXyLpQn3vmLepaVpZzd1ohd2lEibULypoaIBqZ6noRy7tY
	hnsgt72UNa3LBtQTErlfK87jOqGTeDpOlC/MjeLTx7txWUSNa486iP11+S8bKikqdaqUx2MprvWZD
	1EE6aArayQzeufktyCKzUkwlb03QeEjcvwRl69oM/lwibEX7VOsK5ObILg/5CZKzH3Pt7swnNH7ei
	C65vWWwt3fJeOt6CmZp36H3v/jo8A2LrioQMVod92Aq/MEkWp+1v2ZYxm3Rs8eO4LIch/VEl97vf+
	+n0qU8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jKP-0000000EX9m-0iTf;
	Wed, 02 Sep 2026 11:40:29 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jKN-0000000EX8t-0e42
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:40:28 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so1477322a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349225; x=1788954025; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVkVuPhoPxzk6Z94L3N0Zj2zqqxuaLOIcq/Bx7B8iNM=;
        b=TJYOYoDJQcFMmAchLfjsdbS2+qofyhahziAlLkfIa0f/fgorrsKNmw19QwrVOVJz+f
         Yet3UTnCRSOJfkIRHewLMAJpt7pVLG/Gfl/MPAV6w7fBVCI9dRXBJWi66/elfZoz+b0U
         j/WjlpiLt1aO/MhnwLHPxEWpnQWtnFXaKxPLXB+lGY83P83Ljx5n5nP6Fea/++dGvz7L
         Q84H/4vthw3JBsBZE9BLuZ1/XsyDy0RJC7+Kte2kNZJeI04RC+tD4v8QiU8oLF7hNxG2
         toubX2pgBi1cbwsIVW7koowMG58hoqu5zO1QEm6eVPTADx4n2OVtZmlRMIwlGnG0jwJC
         iQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349225; x=1788954025;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVkVuPhoPxzk6Z94L3N0Zj2zqqxuaLOIcq/Bx7B8iNM=;
        b=CpUFoj/XPaXXTN4YaSVulXsjgxhbhj+XzRNX7pLmXevA58Ww23Q4F5kuUkVr3L5vSM
         0Fy/SZpaUPfWu9GVd3iyOov/sLCwqUt5zqpVpxdThrUXowVp8eTlKB19ECC2SFtFGEh+
         B+pOwZI9y82YzP5gWpmhqQOunlEIPar2zeGIiNkV0J7lrPQKVqvIYFwOERjPz25U0ukF
         zcKkFHqZ23P7IOSXRcvndiodiy0K6pZsOPl0TamUV6MaUh4qVVRnecmX4ySZBp0KqD74
         +MMtjhGJs4DDVpiC7HebCs36qyJscfuqLyNTCcnRMCKH6anYlsvPZAJstqg39Lppy7tJ
         tWoA==
X-Forwarded-Encrypted: i=1; AKwUvBw0mNP+ai8+qK0IJAP4tdePcEUZzTLU2ekyMFfTz51c/7+MVFGz180l8ZoK7aPTgw4iCysmKZ8w9spdppPUrSX+@lists.infradead.org
X-Gm-Message-State: AFuF++m/YOD66tni1PD4UdiE/A+9H3XXLVp86cbiCjT+Kt6cl8xp4WKb
	0SgEr6ix8heQx1rGbrSS+cevTpCPW/NcHX4tHr+YhJrLlML55rYOw4V4
X-Gm-Gg: AYBFou3U/cl4aoBpOPQ0IpQOG2wr5FwVbdExc/QGkKfX6zXwsBTZwY/mz3lC1rHe9/P
	a257HEESI8c2UVUfgx7LtTSs5+QwcAV9eT2vcjFFDi9GDh03zND21pLmuxi+wPKcm3om7wTn6Kx
	sTCxqJ7lGbz884R0+DoGAHhkIaokpVP4OJUqB5tOuKPYQ+ZCQGntX5sG4t8ixEAl21diVbyucV3
	2Su0vve5a2Y1awSdb/7NxxkLI+EdXTtdLy0QZWHf375I/t5kF+uaPinxIQopfWrspKXVVx0kiJe
	fgoL+OThIOFDpq+6nEMGKFYXCXGsTEWOTuzCJJVvq1SE7Wa6Bnh5BgjPWbJ4L/8c1xfngmXNP6Q
	jpjkD9qMFf0e77YfWf/33/yoYdM5hgRKXjdCb3IwoVU/DKlMApgRdG4VtBD/HL8BXwIy9VaPAgN
	Mp1rYy0AYb0ZOClvW65/ykM9Prc/S3i2BKXzrLY5vQESCTYtZClQKUeL8QYzAX+9hEcmamT+NG0
	27A6F30YQb02l0foimGKes=
X-Received: by 2002:a05:6402:218a:b0:6a6:584:d9e7 with SMTP id 4fb4d7f45d1cf-6a6832e4fa1mr3314668a12.15.1788349224695;
        Wed, 02 Sep 2026 04:40:24 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8c7a0esm939877a12.13.2026.09.02.04.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:40:23 -0700 (PDT)
Message-ID: <2d7b127d-6079-40c0-2020-dc7767b2396b@outbound.gmail.com>
Date: Wed, 2 Sep 2026 13:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
To: Mike Rapoport <rppt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <apVmYXlqsVr_p4Oc@kernel.org>
 <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>
 <apcKQBRCFeF-usK7@kernel.org>
Content-Language: en-US
In-Reply-To: <apcKQBRCFeF-usK7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_044027_243744_CB1D8B71 
X-CRM114-Status: GOOD (  14.87  )
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

On 01/09/2026 19:24, Mike Rapoport wrote:
> On Tue, Sep 01, 2026 at 10:42:47AM +0200, Eli Billauer wrote:
>> On 31/08/2026 13:32, Mike Rapoport wrote:
>>> For large sizes kmalloc falls back to page allocator anyway.
>>>
>>> And the doc is out of date unfortunately.
>> I think it would be a good idea to update the doc first, and by doing so
>> officially change the API. After getting this change approved, it's indeed
>> safe to rely on kmalloc() even for larger memory allocations.
> The documentation always lags behind the code and "official" API is what
> include/linux/slab.h says :)

This is what I found in slab.h:

  *
  * kmalloc is the normal method of allocating memory
  * for objects smaller than page size in the kernel.
  *

Maybe this needs a clarification too?

Regards,
    Eli

