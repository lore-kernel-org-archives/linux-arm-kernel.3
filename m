Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911B0CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMlAK2z/O8nXAXVGpgv2TVPDYvKc2M33iVdUjIQEOVI=; b=l97aW0aZkTCNscHF2uzCrurteN
	s3nJ+iFz/hRNFTFLzCyBldLSzRp/awP2CVBgFEKUPqK2N0pvjUcUjAx/wmN96efpnY4cxRWNPrm3m
	j6Lb/Isp7fqMURxCdgFZhefYnCY/rUVRvxm1kMQamZGUuWlcmCMZrCbhL6j5A4kklwluQM3GoBS6e
	r3/tpQlnbwS9bmXBj6AoJwLYMGQE0kNS22uK1xZCqg9U+TWE7ucWw9BpgLx80JFFMMDn3mXDkjHmJ
	5gcwVvPRVE/srj3tq9Noo6qcg7v8Q64GTe4RY6EGQWAe681nAjdofDqIegLJ25ekGXnI8RZ4j+Tdc
	sqv+kyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3ak-00000007v1u-0tqX;
	Thu, 21 May 2026 13:37:38 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3ah-00000007v0u-1L3e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:37:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso5707446f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779370653; x=1779975453; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMlAK2z/O8nXAXVGpgv2TVPDYvKc2M33iVdUjIQEOVI=;
        b=txA03b3IuHuXxgp+kJNbxXMCt1KbuB4D/juvEdNJmXlJl9SoyRuklI7N+ghfaU8/8P
         8P2eJ1ZWyOEyMBHq2lBeoCStFjbAfSlbrlNVLilyzvzWRlVlWSmFcXrupAFeNHl7r5SB
         OczlCaLARlTKi7fwWJykVYdLl0dM1aGgOmHxqeeMhrTC/yHshtZr4/cTes5AFV4RiJPU
         VTdw9KGfcKuJOyBGz1AeZnYiwPfvziGVJaytnzLmdl4nDh3QOlg/JfK/cIUXE0tRfSnR
         jZI4GhujyTxYATuP97f8A65qbjGpUcluWgGDej3WckAYyrogMxMi91tObaa0O4cugW+r
         R4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370653; x=1779975453;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMlAK2z/O8nXAXVGpgv2TVPDYvKc2M33iVdUjIQEOVI=;
        b=fAkWu0qVgWrxmH8MYajOszzPLZFP7lIk6422hAeQSN7+9eInsaCta9pNvaFre2ij8n
         HDHwWG+t2qLBzPx9VQShlD7WvB2948FPDUlpGbvfnNB75BkIzr0o5yqdBVl4QIVpvs6G
         0/pJQY63UQf5AgpMNzru0U8qUzMpVacuOZl3VkMEtLOeqCkEZtilZP66zVvXZG7lVHlw
         7+zNwN/bpApkgJGdSV34pKJ19PHI9uQdn+ryLBEjjWjRj1zbQlik6YR2Pn+LLysev90A
         Iy3jB4bs/PKsVTSBc6yVY5KPGOWQKCtNgQ2yzCB3dnKmJlORmWdah/sEsxQprd5MrjQx
         WwAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RX/BRZs1+E3Kno0p7TzTRIisSgS49czVLar55lJvT7OuVBalM3BEgmzEd/tEmu2J2px50pxoopK2BIOYBt2uF@lists.infradead.org
X-Gm-Message-State: AOJu0YxjlfpfF6BSdLNRzT/Ur/UoIWfADpivssNkb9MLysv5GV2lE0mw
	01Jlw2QAFwhkZwwkIQc5jHZL5TfZNPp3rRdQLzyiabul7nyJ+OeZyZAgk1zh64s3iiI=
X-Gm-Gg: Acq92OGgLkjXI3Lrr+8Cx3WZlunzWuYl8V2gNiZ/iBfvSc6Z7i9k+7cmLxwTXm2QUdB
	6LrMCZlFj0hphrel0TkxA5jIvhiKlxx6CUCgE3EDjzsv1bH/Rrdx9VGjHiQre2yhKSjBDpmgCJ2
	9s1pwOSahqXsjIEZ6Eq0AKqqvNwjPSpt6CBVpCQGl6IdW2pDEJHTInMOrzpsNPV/5+5Dotor94K
	QMHwzJiREdIYHjGhjNNapogV7Yu9CnBVe9G+I4vaNv5jWkEw4JCrSZBjCK7117bC6lh7jcBPD+R
	yKPg8qL+1T+p+XTBWG25VBwjn0yoQ8W+2oSXM1mBaD0ZgKKy+7oailhAGrf7q59E7kyfladaZVZ
	Q2I7exDQ/R5S8kVZRbi8+hIFRn+XbkYXiEdzzZVN5g+y9nVFt3SUM1GjxiECrLvflK/kvI5kDu+
	lSrq8k6t24JWjTangDdQJQMez5/5rG1XEh29njepvyqwYYPBcyJ8CO9hHbOZdVwGcNe8u+AoOgU
	rHPTlzAHBfBVqDgQQ==
X-Received: by 2002:a05:6000:41fc:b0:45e:739b:3e43 with SMTP id ffacd0b85a97d-45ea344aedbmr4835322f8f.0.1779370653284;
        Thu, 21 May 2026 06:37:33 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:7fde:b714:8ff7:ea6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm4331310f8f.6.2026.05.21.06.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:37:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 14:37:31 +0100
Message-Id: <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, "Lee Jones" <lee@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <jyescas@google.com>, <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
 <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
 <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
In-Reply-To: <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_063735_394657_A685261C 
X-CRM114-Status: GOOD (  28.22  )
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

On Thu May 21, 2026 at 9:25 AM BST, Peter Griffin wrote:
> Hi Alexey,
>
> On Wed, 20 May 2026 at 22:01, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
>>
>> Hi Tudor,
>>
>> On Tue May 19, 2026 at 4:46 PM BST, Tudor Ambarus wrote:
>> > Hi, Alexey,
>> >
>> > On 5/18/26 2:24 PM, Alexey Klimov wrote:
>> >> Thinking further about this I'd humbly suggest that even
>> >>
>> >>      if (fw_err >=3D 0)
>> >>              return 0;
>> >>
>> >>      pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
>> >>      or pr_debug(...);
>> >>
>> >>      if (fw_err =3D=3D -1)
>> >>              return -EACCES;
>> >>
>> >> some debug message would do.
>> >> Perhaps we need some convertation, for instance as it is done in scmi
>> >> code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have a=
ny
>> >> data for mapping acpm errors to some human meanings.
>> >
>> > I did that for the pmic helpers. I don't need any debug prints for
>> > gs101 TMU as I have clear instructions from firmware: 0 for success,
>> > -1 for error.
>>
>> This doesn't look like a right approach for upstreaming a ACPM TMU
>> framework.
>>
>> You are trying to submit a gs101-specific implementation masquerading
>> it as a generic ACPM TMU framework, while explicitly pushing the
>> refactoring work onto the next developer to add support for other
>> SoCs in this generic ACPM code.
>>
>> The ACPM TMU protocol implementation on Exynos850 is different: it uses
>> different error codes, and half of the calls in this 'generic' driver
>> are not even implemented in the Exynos850 firmware. Relying on a
>> hardcoded if (fw_err =3D=3D -1) in a driver named generic ACPM is broken
>> by design and may silently swallow critical firmware errors on other
>> SoCs.
>>
>> What about such options below?
>> - rename the driver to reflect reality: rename this specifically to
>> gs101-acpm-tmu-something to reflect that it is tailored for gs101-s;
>>
>> or
>> - abstract the firmware error handling paths through driver_data or
>> a dedicated ops structure now, so that other SoCs can cleanly hook into
>> it without having to rewrite the logic later.
>
> AFAIK it's pretty normal not to add new hooks before they are
> required. I think the approach taken in this series makes sense, as
> it's the developer adding support for SoC #2 who best knows what the
> differences are on their platform versus what exists upstream.
> Similarly, the developer adding support for SoC #3 may have different
> requirements to e850 and gs101 and that developer is best placed to
> refactor and add hooks or quirks that are required for that platform.
>
> Let's not try to boil the ocean with this series, it's targeting GS101
> support. We can evolve it for future SoCs as those requirements and
> differences become clear.

Peter, I agree we shouldn't bother about hypothetical SoCs. However,
Exynos850 is not hypothetical (I guess SoC #2 in this text). It is
possible to take set of patches from maillist, copy acpm DT node from
gs101 (minimal compatible rename) and it will be Exynos SoC with enabled
ACPM. I am also actively working on it. Hooks or whatever other way of
handling firmware error codes are required now.
We actually already know the differences: different error codes and
only 4 ACPM TMU calls are implemented on e850: TMU init, TMU read
temperature, TMU suspend/resume.
Extra TMU calls are fine since we can just do not use them from thermal
driver but hiding correct error codes, well, that's another story.
We already know this way of handling firmware codes is not ACPM TMU
generic.

The ACPM TMU part of gs101 ACPM firmware might be a vendor-specific fork.
We shouldn't assume it strictly adheres to the reference Samsung ACPM TMU
design.

Alexey


