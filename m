Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326D2CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJ+COE47TCHOzRJeglSqxOxxNZ8lIMv/9xSnCNeoVAA=; b=FRtfkPimsU2uSxPq6w4G88r6uS
	1H5xmCmyv2aRtzJXV9eIKftvnQrrQRMviAyxVn4ZsqGe2/rPxiYx+327jB/yRF389CwbhX1JQxWl/
	ALSjbp2ckRTo6Z2uWLsQm5z3b/kv2lNJOMnuzPA4kO72AzNRivkEE0tX46DzoAZjUqqI2PLwxH2+W
	3alc/rX0lBLyM6z2oRhGJvAtuxK6oj52RWwZR00OjzjFDttECsIeEm/9Dk8yM5Xh/Kt6IARFdWEI7
	JKc766h+MObkrVC2xRv0DXQcbFXkcqId6rgA0BPylNecWQswLo57frYgQ/JlMdvpJuLyjJO7QRHDX
	QfgP7zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPECC-00000000NyK-18Se;
	Tue, 19 May 2026 06:44:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEC9-00000000NxQ-0JcC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:44:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-44e5624c053so1816737f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779173086; x=1779777886; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ+COE47TCHOzRJeglSqxOxxNZ8lIMv/9xSnCNeoVAA=;
        b=LpoIc/QZEoP+dkiH4TgnUwUAttPTzDamMCRYncfpaYEWH48HGEDgMAghO5Ra1A6ref
         Tbj9x5iEke9LgrT75vK7tWSUMUYJK5zFwD8Jdas08mE7wkgJR77kLk2yjCCa2N8enKc5
         2tfKxOO+m8aMFjEyjeyhRAaMBtpmZTaab7UUNbm8JJsQzCniN3fsOJPTcLP0g1Xr3uJ+
         /wwrQ2ZckWgfqmoB2vElPuPLV2AIR+foOfDYj6uFI7K+8ohq4D+yD9lXAHNG52DPkmUP
         ri+mFSDLlrmpGEs+XO2MTFyIyeLfo+/V7H/ThBRo6PHs5k5Cy0aE5mv22fvUp+x0aT0e
         /sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173086; x=1779777886;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ+COE47TCHOzRJeglSqxOxxNZ8lIMv/9xSnCNeoVAA=;
        b=DxsGwv5vkWn9ajfgnuNnnJ+rmdCGiWAQKswNMBS2NJHQhNeV/isYlOb9f/rqrOhLjR
         gW+XIRXRSsG9Cl46LgFDQVgFhHIuoOX+rs94jeYYVPslYQ/OTJHwryVqlBRNO1SuzkRP
         Xanl40FOf0JhWOrKll0sSB5/8+O5auis5fegmhyCtc1QxkJ7X7bQbrJRVuL+GTRlVgKh
         FZkr9NM4soGJhzq3W+sWaXeuKZyzPDIlYf5/0h70mHP0YLM34EZ0jGtBHBXOnGaSP4I2
         ZTi7sJE4uFLWU7Hw1l9UBb3kl7vJGxqDRjj72vDMJJofnqQAXVYGsFt/nbs1sEko0Y8d
         /UMQ==
X-Gm-Message-State: AOJu0Yy3lIBykmfVHFQl7Zu9UR0RYXTOK/P9Gm7cjJ8uEKXwPOUA47vb
	5uv8HEduCFmYtukR4uPm4mA9OzaeGiaop8qvglZ3tlYPUu2lZ3Vm6jV76xu9UWZ5Z3UChDzyxXB
	abLI=
X-Gm-Gg: Acq92OFBKyUSqGrq9GsTS3G28cjl2lDPc+WwqJe37YpAvTbLLw0UTyXkgW6zmuYy7Ra
	hpsbbO/xhAG/jt56/FHyeZohGMH/byxM9btpHED/+TD1rDnNi+YwKyQDgeAYJuVp1Ds45tv6pIj
	CoKt13LEUsBJXiVALcBKoBuTHYz8rEQ+IeRabDEtd5EfiqDorfKSnUHFQVv31XytVoQMYQUNRnD
	ZN+4+YbN5LHcXjoOZdF9ks6uaPGkLGLrAOCsALsIPEHBLtiaQ+fwHKCEILYXwGifId0wL0jIsCe
	y5yXw2aD9OoHW9CMoSSvXX/llH4IDgdHTJEOfCk0EYMvX5rsGnm12CBOoiqbdH97DI/TwY8XTzm
	ZZJ/nPC1IjXXfq0agirfC9JrkrZdjazL3pDpGDFDqFmK0CruJDUfpaDAonwOMRoTdchutoocTDG
	wK1gUq2DJb4SYNKB16uXQkNGhsJvJzPH3mIK7/ljpkVUZfl6ZmZ35/agqQ2ePLWqE4rz6u9ezBQ
	WS/My0Mm3Xh5y0=
X-Received: by 2002:a5d:5850:0:b0:44a:a729:9f51 with SMTP id ffacd0b85a97d-45e5c58fb1dmr27522030f8f.3.1779173086560;
        Mon, 18 May 2026 23:44:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm45046613f8f.29.2026.05.18.23.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 23:44:45 -0700 (PDT)
Message-ID: <58a1862e-3702-4ba9-965b-2eb248c05c60@suse.com>
Date: Tue, 19 May 2026 08:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Cc: Russell King <linux@armlinux.org.uk>
From: Jan Beulich <jbeulich@suse.com>
Subject: Arm32: correct string.h functions for "int" -> "unsigned char"
 conversion
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_234449_141547_72406161 
X-CRM114-Status: UNSURE (   7.57  )
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

While Arm64 does so uniformly, for Arm32 only strchr() currently handles
this properly. Add the necessary conversion also to strrchr(), memchr(),
and memset().

As to the placement in memset(): Putting the new insn at the beginning
of the function could perhaps be deemed more "obvious", but the code
reachable without ever making it to the "1" label only ever does byte
stores.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/arm/lib/memchr.S
+++ b/arch/arm/lib/memchr.S
@@ -12,6 +12,7 @@
 	.text
 	.align	5
 ENTRY(memchr)
+	and	r1, r1, #0xff
 1:	subs	r2, r2, #1
 	bmi	2f
 	ldrb	r3, [r0], #1
--- a/arch/arm/lib/memset.S
+++ b/arch/arm/lib/memset.S
@@ -24,7 +24,8 @@ UNWIND( .fnstart         )
 /*
  * we know that the pointer in ip is aligned to a word boundary.
  */
-1:	orr	r1, r1, r1, lsl #8
+1:	and	r1, r1, #0xff
+	orr	r1, r1, r1, lsl #8
 	orr	r1, r1, r1, lsl #16
 	mov	r3, r1
 7:	cmp	r2, #16
--- a/arch/arm/lib/strrchr.S
+++ b/arch/arm/lib/strrchr.S
@@ -12,6 +12,7 @@
 		.text
 		.align	5
 ENTRY(strrchr)
+		and	r1, r1, #0xff
 		mov	r3, #0
 1:		ldrb	r2, [r0], #1
 		teq	r2, r1

