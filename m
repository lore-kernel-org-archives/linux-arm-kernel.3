Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF58C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sKNxUfIZoJNayKPK2p5wI6UulfeeiAabrrrR/zgiCQ=; b=DNBMVO1DU7S3gZ1K0CYyWDyHcy
	joTktZW3AgsOkQVjuBqFxgp0iiG5364FB9CUvhaxeCL+D1PKbmTt6e8GMYlxt2qXWogu6pK7N5VpM
	7xvS6PJS+cBlK98pn/UBetIC83Ngs8pv/F2fHU8Pie0MFjbR5D9ZY6zZ1OzloMXXSD3TpqeBYCdBQ
	YooX62j+fI0S5oQhpEKaDcn5rsJZsb6FKPmER+/rZb+e1Nr4+n7UeMlJJ+5opTq/SHFp8AP6Ngl+A
	LdVL5ramv66zz3/scmYS3/lTR11e+5zT+37Fq7RG3M3nAEZ5W9kdc6yBJ5XrisEfB0UF7qLCFybVH
	klNh5jvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L9b-000000084N6-2itz;
	Wed, 23 Sep 2026 11:28:47 +0000
Received: from mail-dy2-x21.google.com ([2607:f8b0:4864:36::21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L9Y-000000084Mb-0jjB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:28:45 +0000
Received: by mail-dy2-x21.google.com with SMTP id 5a478bee46e88-33bebf0aab6so377550eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790162923; x=1790767723; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sKNxUfIZoJNayKPK2p5wI6UulfeeiAabrrrR/zgiCQ=;
        b=aTZIKvbEz8esC9UBYGDtBNqbjivAfchn0R43bm/ztxiEyf86dJ+5KAVXJG/gVvIh/y
         Fjjg856x86Lsfc4VS8utFHBJm+qW7EZ1wukQ0McBEa1DuGVDGdlMzpGdo0PjMTF408r0
         ZGvXcmJJgvcuLcJJyNvBlQyuyRMcRofEmb+7v0tE9h0pvvY4wjqhqGgQiLXrifN1zvb6
         zTHFbcJ+fMa4AZMEBxCSS7bBao0E4d3+4UKdejGADniNRetI84pf7Guu3TTOGjguEDNy
         k39V7mfXopf0WSyhDP6xTY6jROe6GRZ/vsrIKBoOUmCqjFMDHXrBMjM5ZwKcqXbHHHox
         zpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162923; x=1790767723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sKNxUfIZoJNayKPK2p5wI6UulfeeiAabrrrR/zgiCQ=;
        b=MvuJT6PZWYKcTtFIgUnnom4/nNRtKqfxQeO2+jrb5SS1wtMqlvVSfxcvjG7NX/o5bN
         22DU+Dd5rx3MDob6seF8NpTPh/LLANKl/qBxr08uQejS/iTp3oh0XSM3GRTY0emclg6l
         yt45kDQg7M0P9qg7uZrIqk+ZpLjptNkvJuiihQ53uTenanq7XyYYIdXBqstK6B+f6SQL
         sdgoVRdvhi6d35hlF+qivZD3QoYmTX2PpbKdlNzuI5UZQu3w8fMwZBORys4iecPQQjqH
         ZGiitTjj7v8xGNApsV7hgNVic5p5OmA59x/98ySt0BFh5eMXVet1GQ+FI0dBvD9Gimth
         XVJA==
X-Gm-Message-State: AFuF++kdFabOw5jMouaK9+fjLMIwCBm3yM+dGvMKZUEymBKehr0k0dbr
	6QhghGXnLpr1SiIvGnmYMjPF/h6CePmdK6OBGYgDPhl8cnrVHiZxP5XO8I5dZo858zI=
X-Gm-Gg: AYBFou3kOVuvh08ey3cM5bBtg7QkFnev9ZADSJnp4S4rVPtIXkCTHN1O6lUSmtpzZM8
	VuBag56WAKqSOjoLVBnkB9RWiGUeW266/bcoFzlU2GNv84CSKzfBKFejl/LECgHZckXIe23g4IW
	iyc0phEoJfOTX70ECCZSSJwkfQtq8BIOJQWF7wNn0Ir8fRg6/BRWKM0sCwwBfjItuuDF/L8XnNh
	toNBqYjopr2rJX2BCebJK8V0uudbDlFE+29xqrhugoo05g/RWNPqepFhHAKqMGDJTqOzF63gpSa
	WQHm3XIaQM0Oo21csjm3d6gu5Ew+tfNfr8Wb6ACDxGCUyPGDb45zYm4mRnSPHxJCKgwxWhEI7bF
	zbnGZ9XPyZHe/4/mDCk/FRJeF71fMqQ4xRfgHlQcZwyIdVMCeYXMYYvNKKP/y89Gneo78MRqXrI
	UTu/pmZ7/LtR8JNNsTTVkkQAW39CAjAPR5FrVHMaKEheK08fY9Ax/4csOmxulR1uJleg/yWw28t
	G5l8KhU46me7jnLoc9s6Dn3y0MTRv/FCv/IMzgBIjp7T16bdjmgy1069A==
X-Received: by 2002:a05:693c:60d2:b0:33b:f588:805e with SMTP id 5a478bee46e88-33e8d7d6b93mr2288879eec.20.1790162922427;
        Wed, 23 Sep 2026 04:28:42 -0700 (PDT)
Received: from [192.168.1.125] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c63bsm5910552eec.10.2026.09.23.04.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:28:41 -0700 (PDT)
Message-ID: <c4393178-5b5c-4645-98fb-9855b552c2e8@kernel.dk>
Date: Wed, 23 Sep 2026 05:28:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: Gabriel Krisman Bertazi <krisman@suse.de>, io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@kernel.org, mingo@redhat.com, peterz@infradead.org
References: <20260911154148.644489-1-axboe@kernel.dk>
 <87tsnv1ynh.fsf@mailhost.krisman.be>
 <54310fb2-d4b0-4b97-bc07-68e27e462b29@kernel.dk>
 <871pal0wnk.fsf@mailhost.krisman.be>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <871pal0wnk.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_042844_235248_08E31CE9 
X-CRM114-Status: GOOD (  19.04  )
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

On 9/22/26 4:05 PM, Gabriel Krisman Bertazi wrote:
> Jens Axboe <axboe@kernel.dk> writes:
> 
>> On 9/11/26 11:33 AM, Gabriel Krisman Bertazi wrote:
>>> It has the downside of still requiring fixes to every path and we need
>>> to handle every new case that comes by, but it is much cleaner than
>>> plumbing a nonblock flag several layers down the stack across each
>>> subsystem or having subsystem-specific details in io_uring, which is
>>> what we have today.  On the upper side, it is much less complex than
>>> your approach. It also allow us to just back off during memory
>>> allocations that would block, solving the memory allocations anywhere in
>>> the submission path, not only inside ->issue(), which we discussed
>>> recently on discord.
>>
>> I think you'll find it'll be a lot MORE complicated than my approach!
>> Backing out error handling is going to be impossible in some cases,
>> think file systems for example. How would those cases be handled?
> 
> I understand there are many cases where it would be impossible, most, if
> not all of them, involving FS.  But I naively imagine we could back-off
> those early, before we get to the critical session, without even trying
> the nonblock approach, similar to what we do now, and punt to the io-wq,
> which is not going away anyway.  What I'd like to solve is drop the
> logic of other parts of the kernel that we need to keep in the io_uring
> layer, such as which network protocols will block and which won't.

The problem is that you don't always know until you're at the point of
no return. If it was that simple, we would not be talking about these
patches :-)

-- 
Jens Axboe

