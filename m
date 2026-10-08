Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B030CA6016
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 22:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVDKkJhQMONwczHs0ftCK6WjzDumHDVk9DP6ZY0LChU=; b=MZJupfQlTNranZ1Npvnn/EEZYd
	TKfk2kQFCc3ED/fpd0yQD1Rc6mGo8ZK1LmZrhfX7j4Alth2oE5J7Qp7oBCZu2/A7RTHf+b17s3Tlc
	AEBJ8z7Vcljfhz6OfTha9/FHYcvUbwdlRZSQl7rzNEVYnAAfYPKgLvkAhqgaUAkYgJqaIuT+e/EuP
	vJaW7eNyfX40gNeIHGdG98kBSninqXLjnAc+/sieI9D7wW7fSzKginJYvUCzdP703LTrE9LS5H6PN
	QXkNyLE7ffKiRY/BRWQ1uWCthGnw+WgV/1f9zRlJqDfhcr6/ORQ3mXlKqr42n8iEXBNDv2rxKx12X
	e90JhDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEwQA-000000057Uw-1X13;
	Thu, 08 Oct 2026 22:17:02 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEwQ7-000000057Ub-3dRT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 22:17:00 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-34c4a0868b6so5321373eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 15:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791497817; cv=none;
        d=google.com; s=arc-20260327;
        b=LSM+iPxlQxCvitLj6XiF58L2TrhiN1asDXmMeb2QruVDn4/AdDMlgt9BrB376enVoX
         uzSa7TIOujIbT/vROcXqyEycjqIeVY/BhN/iqc9yiPCD3bvdQZ2jbDWuBi6I5kg4jEEq
         W9Hjg3cAucazMFvV5F3/2SkAUc0L//W2w91Dpe8gWw4bN5pb4jm95J5HYpQewSVaNJ0U
         RBfF8K2YnOQweGRMzpv/4RGgJ1ZMVAwO9IbhWe4hoNpg84NMqK2gtc/CcwoQKTqLthu8
         Gv/2B5rw97ocW9w+P+FCzXuFKHUFGzlGDCjMXn7j9k2X9fOZAMSAxMSIO3N74k9Kbn+y
         aANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HVDKkJhQMONwczHs0ftCK6WjzDumHDVk9DP6ZY0LChU=;
        fh=zRIq997ogKSoFkzMG7DJSVVV8J4mFRKQ/dOEAYKTHO4=;
        b=Kn0sxAFKmA5cbpVrtdgfJ0f1FKOslk94HX3K17ScxZ4IMGQhRUQRjRBPWO7b+nXjQ0
         jFhzqF3nJ+58hdYB8bNNpniV6K0UVSiHt479IFgSs1Xnx05P8MNS6SXeOJKC9NuVLfFF
         F7VStKiLD0SMAQYskrPejVeyCW9HIj/rGjqoTN0m+ikHAmgImZjGxbugGd3EGL/GMtdG
         PpgaBPKyi2a/Io0F+YTz4uu/z2yp3jYx+04/zUaVV6eLgNdW9bP89ZjTWOj5OkdOCDHN
         BgKsq4d8QWKPBcchslIdy8xRfVU6wa0G0w540r3RcBb0gBBRe/7V6PbthT61j+nr+S8P
         GNXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791497817; x=1792102617; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVDKkJhQMONwczHs0ftCK6WjzDumHDVk9DP6ZY0LChU=;
        b=Lr012KJT0XuYgDqbMn/ytq9w5DBg3aRnSg2w/xUJRWjshyiBN6roU6P9WKd1vJ/eS9
         1K0YvYGk5SmgRyCQnKzOjuS8YEOB8GsYITfs3aWigzGuhB81pwGVy8oGJn5oKvZWAjs7
         YRtPfpWlsk0ixn9SqupXGwnhxJvC8Tioh+cKRlLwhWC2NtqgRFoIrb83Hf0iKxpMlsu7
         F+ukVry1WzGNcmRTUg87Zs6079Xgg7keqreOz+ZV/oIofVDeFVpZa7Iw8Da0LgU9tbwe
         bBORnJfP26k2HnKDDcoh3MsNiya96sm3tg9OlapCBZoulrh653C90z3NtfF6fCl50qBC
         f5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497817; x=1792102617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HVDKkJhQMONwczHs0ftCK6WjzDumHDVk9DP6ZY0LChU=;
        b=CaWehka37HgKVHJbuFqyDjpL/lyc1+x3Kc+ZR5l7SBf6FQFb+z3okS2MpJ6rhzv87m
         +XYiRZrUuMgC14K3UyvxrRVY7h2cdpGwHvxPVAQQjYtx7R0rhUWhND4EKZ8fqX4UjEjN
         IeXd/Q8H2ADHdmVMsqS6QAGZe2oknZt+Mk8qPtduUqyD9XVW8CAuZ/fGw1wHigktfpQL
         TSjXu/Zd7sW76Ns6V3HBusMzWm4z9jreAgYD2N3PWn/uU8/BpE61Ek3YH/agQJQ8+bJH
         XgOuUSZfjRguAihBGE+M3Epn9dOTBc4iGkhtXQ2bRWi/+0czBiR726Cf20XLfqatZLGd
         zIxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiECLNs/PLzi34+vQJQOnAxGX1uwzVwmLx9Z7XcAobpDoY5CPeXszGkz6ngEvi3wG+/uf/6Gd/rTf99+YDouqd@lists.infradead.org
X-Gm-Message-State: AFq9FYIypf+4RphXlZwHmR7OXuDGPF3dqCN8EUP354ILDKfASnzgXsnJ
	+jMpAGCI0Wz/JSiINxpTx+jJQwOaVPDwp/23YijFjE1U0vTsKaRRc3eB2YiXkDACuQm3iCNJ85H
	9UIygGJhshXFL2F2BiKj6b1qQxSUZcM3sCypdTGpZZg==
X-Gm-Gg: AYBFou0ZzAiu7yl9dMM6cZUzXSfTuqCGkg1FaN1WUZPuy/haAr+H/afxQp6g43C6BDo
	BCkqGMSQriEwww7F5z5G79d6K+QUmaAVJH5odm42UZTsa8UVCOsXqFVYyFkZRo8zzdx3Ihq20bU
	KsWa7SSL8qGP7B+gecHJEC9dVH9+AzBOjVdyjeIckW4LG3vVlcvQivYcUfwTuvP4WVcglZ0akfE
	mEVOJL5vzDUl/4tHFO1b9pGhqjCqMmABH79sf2QiqDzS6z39p6/uWWmkfouHx76o6cUpZKv3Y6r
	pPBZJxqnAJwAg4e1hmGcAJB53gohVLJBXuNVjnmn4br8WKeJNYP5rcM=
X-Received: by 2002:a05:7300:c389:b0:34e:2150:e5a4 with SMTP id
 5a478bee46e88-3536c58dbf2mr892218eec.16.1791497816699; Thu, 08 Oct 2026
 15:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20261008-i2c-xiic-block-read-nack-v1-1-94882af6e598@nexthop.ai>
In-Reply-To: <20261008-i2c-xiic-block-read-nack-v1-1-94882af6e598@nexthop.ai>
From: Siddarth Chilukuri <siddarth@nexthop.ai>
Date: Thu, 8 Oct 2026 15:16:44 -0700
X-Gm-Features: AclHuK-e4AvKn1DVj6sz0TdknScpn3tml46-rFF4J0_u7LxyuEEllK9h95XoXnw
Message-ID: <CABAykkvoTxq=mDvpfUnN3H0O9oX-8D+DhWi9SqzrW0f7kRSFDg@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: NACK the last byte of an SMBus block read
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_151659_919657_A22DB9C2 
X-CRM114-Status: GOOD (  10.40  )
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

On Thu, Oct 8, 2026 at 9:02 AM Abdurrahman Hussain
<abdurrahman@nexthop.ai> wrote:
> +                     if (tail == 1) {
> +                             u8 cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +
> +                             xiic_setreg8(i2c, XIIC_CR_REG_OFFSET,
> +                                          cr | XIIC_CR_NO_ACK_MASK);
> +                             rfd_set = 0;
> +                     } else {
> +                             rfd_set = tail - 2;
> +                     }

Thanks for chasing this down!

Small nit: it looks like the tail == 1 branch can't be reached. The
padded branch above already takes 1 + rxmsg_len + pec_len <
SMBUS_BLOCK_READ_MIN_LEN (i.e. tail <= 1), so this else branch only
sees tail >= 2. It could just be:

        rfd_set = rxmsg_len + pec_len - 2;

With that:

Reviewed-by: Siddarth Chilukuri <siddarth@nexthop.ai>

Thanks,
Siddarth

