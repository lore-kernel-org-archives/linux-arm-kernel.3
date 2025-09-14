Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86209CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7EEVogNqm3h2fGQuXoQvzBFJfVHtUlo6y8LaBgKxgU=; b=RNN0nOuwVx8ZErFHoOIGhwvEa/
	YInGRVYGkLJ5fhY9XEaZCUxV/gUGnktucrRzasc7x2tubW1VQoKFs+4quVmzeA2RMBzWQCEsqCE9Z
	zDz22e20gIrMADUBz137zqbweIc0No/VZXUehrFUcWqcbWYdbrOdFUyjHQ0tunv//rLL0a2rQx0wK
	FlhUHKpCadPBWMSRblCZGEqFncWtkECq2fhfylZcooTTIItqvOgM4RJLv64TI5UCE3VJXuVHZTkmm
	Xi3bjyrgsuLvhO1/gysp15ZeU1CBGPJEmdGGyJpqttDQRk5kEslkx1Oyljp+BO0JBhG1PX9MTklQC
	7tXkTq8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlLI-000000012HI-1q4g;
	Sun, 14 Sep 2025 11:56:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlLF-000000012GW-2x1s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757850984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7EEVogNqm3h2fGQuXoQvzBFJfVHtUlo6y8LaBgKxgU=;
	b=gWHy8OytRbrr+hxTPoJtG9xDbnqKkDF74kKE8rxEGti4rFBrSue7Q/T4bQt5boZbVlihiW
	eIUELjWG0tcyHnRXETW5s9mQejxFaMLvCqJC2OM30PyUyON4DxHiA7QixgFcdssc4lLH2w
	/UKidZzfZ5yjwuZTv9i8NkFOGZmIrl8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-1yQzXL2RMJ6uV1M1vVYJnw-1; Sun, 14 Sep 2025 07:56:23 -0400
X-MC-Unique: 1yQzXL2RMJ6uV1M1vVYJnw-1
X-Mimecast-MFC-AGG-ID: 1yQzXL2RMJ6uV1M1vVYJnw_1757850983
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e86f8f27e1so945074385a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850983; x=1758455783;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7EEVogNqm3h2fGQuXoQvzBFJfVHtUlo6y8LaBgKxgU=;
        b=CfdyKfnnkeyOGbH8h2JLljzwiBPqbsEWasLfrgi8VJTqHeOVsObix4EIupL9z4qwgr
         AKgHcZuHaDw4jHc7exdNNVjRYT/aRJcktoxeXYlvJGof9AKvVbyIXx4NZ+JJjdkhGVDV
         7te69ha946XF/EH8lu+o96zlTFPgTPK9LCtYeAVvcCicPIfxNOJAGmj8aV6e2c00MrlF
         OM2CD6nM2bhroFl0OVNxZyk1Q0gKqSMqJWgwd9pwBcP5G5Xw6sALpMbVthtjm9Qf5b3F
         gZ/BTqTvoZLD0FWBh/M7AtTm3qxV+Ebc9Xfe2j9xGdbnsF71h+5yijdcicicNLfpxYaP
         Q1rw==
X-Forwarded-Encrypted: i=1; AJvYcCWsLroHNTxzdO1krHFdqgoIhyEPtBDiu513DG5tV9ddInUORAJ7Ix7QA0srPooj7Uv8oFtwXOmCH4YSJXdYDVam@lists.infradead.org
X-Gm-Message-State: AOJu0YwUruvcQme7SKATrsVEZO+OYRSY4+S5CsgU4KW8Cunmw8JpG5AH
	V/H/U9Iir4IpCqbhNzvVxCnAmRZPP8GWnqHc7aO62VfDC3KbiW5p0X9aXBLnw9rvjx9svVIeu85
	xCVr1pZ7f8mGBvYUh3RS6P9v7cSzfusI5lJlqljCYusi4EYFd9XLxxjfnEuD0qZ8JnG0SEiHo7q
	39
X-Gm-Gg: ASbGncvQ9x7CJmTGlaBCjmicAdrE0rPgvb6VggWBkji8x9I8BHEngz9P3NWiUJT4NoQ
	V3VQEfbOS8uzb+pw5XMG+O2633cjcvjGeauVM+lBGR6AGiC/LqQYd8jGOCe41kLTbpEgrCtVFDb
	nPKOTKXFsLfFMQMCHY72p5b2aXs1nWChMhH0jIGIHfVxKBV+J/AdkF7fUhht4yspxpth/85HSQx
	S/o+XHln2u2qta6WsrmR0h/R8wKbC8XU/rrWK9rDerSAqsrHuA1Ea3qEFVRW0gRd0FYH38Vjota
	NGITanocTGMji5VO71jHO8LphRx1R4ZNgpPkfqQ+bFOjsRpSgqn6H/K64D+Xahx3SM8r0neBgZx
	zSkVyFSqB9mpkaJEjVcJvhpZjIcipHaY=
X-Received: by 2002:a05:620a:414f:b0:7e8:8f35:1d2b with SMTP id af79cd13be357-81ff181374emr1625000085a.2.1757850982921;
        Sun, 14 Sep 2025 04:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjgXFxjwySPCU3ek1M0DJbAsGYTyjXrUec8xKOuYaZ+ALRKNikNG6Y3NJHY97G0hh6czoOhA==
X-Received: by 2002:a05:620a:414f:b0:7e8:8f35:1d2b with SMTP id af79cd13be357-81ff181374emr1624998885a.2.1757850982589;
        Sun, 14 Sep 2025 04:56:22 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820c974c848sm587652085a.23.2025.09.14.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:56:22 -0700 (PDT)
Date: Sun, 14 Sep 2025 07:56:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <aMatZAX6eFI1RmDH@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jndi-kbdRjATLXa16t7_dLM0bGDE8wRkpVe_g2okaNM_1757850983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_045625_815365_8E058C8C 
X-CRM114-Status: GOOD (  12.53  )
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

Hi Iwona, Joel, and Andrew,

On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian


