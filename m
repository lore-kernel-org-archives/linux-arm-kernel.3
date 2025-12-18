Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C47AD6E2D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34kJXR8Z1l9xoA5XQbc7lSV8iSBzpyKM6gKf5HXGiIw=; b=I/NZ0RS8r9rgcaThuYQ53zQ+0G
	G+DwbZlYKQ5mySg99sLBsf58xjKdV1ISgUU+8R4V55bB0OEK8e2+1kti6r7bfRkS944q63zmENXeh
	gwz8bLWqdDWsnJX4usXARR9AGH7D/VWvBIiDx6GO2MYIYXGQtkL2Lxsobv4vkFCaZJiqCgzAWQdf7
	PxuwPbVyoidWDfmtcge0kR6H6+AYhfULgqRccUeiBH+bcfSCtQWD74xzLurDapze80lLnasuOHUrq
	hIpBY7cmYxwvCvXu/D4vvLwHkWlTCqgRTjYYKDPZ7QugelPBVJo3OibnC80vsVQfHp+fU6s8m78NO
	HBcrUmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI8x-00000008wtE-0dQK;
	Thu, 18 Dec 2025 17:50:27 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI8u-00000008wri-20lw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 17:50:25 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-64b8e5d1611so136847a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 09:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766080222; x=1766685022; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34kJXR8Z1l9xoA5XQbc7lSV8iSBzpyKM6gKf5HXGiIw=;
        b=kNkCl/1lDAqswu3TH+ZWM9eiZFseB0Q26AyeVtc1BCdNoYz4E6gROGxpNuCtxJFYGf
         9BS4p0N0BHb7Pft7SVc3/l6ZVGuRp/WMHmRo/sOa0dlQOD01oaQMz8ecaIzZZt60Vqg7
         s78RdFmsZMIJoQ6XsoZC62MFHyLXALguBSYRqrhNZ68sdOpARafscWVUMioVKXrbXR5z
         3/Pssfbr6E+t+qV8ZRJMLKYKBru6MsgZD8URSZm3v0eSblRB/7NQsGYBe4jdRZtqu1ZW
         UyD8NUKI7RGLykRCyzSa4Z3LPyzI0gko9llC862NG7o+nhk+7dxwz22VqJl0A3KFGjcs
         2Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080222; x=1766685022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=34kJXR8Z1l9xoA5XQbc7lSV8iSBzpyKM6gKf5HXGiIw=;
        b=EyH/7U461zdExsGmqa/E/tgKOxo3ZZBHlfO6R8NvYiIB4crVULvROAx47TZ5W7B0aP
         7XBMS3ivT+lLsZE5u1j1gIXaqpN1I/w1Wrya/FSURp1Cra0JwrXQ6sr162E+yt1uYjrg
         QWDjk+gSKMKzpAyl0xTMYlI0fCrbFlo3J1HcHHtDjOWURTcOrcQ50Sc7UNhu3eC0IdsS
         14E+vebYiLMGqu+4hnnJb2Ua/St5aldtVyKERLFkjzsKHDCkHCXYP6fDyF+wReu08bL7
         IckjE94pRPHr059ILYWnohUseylUtnH/TxfM12No8lRFjWNfgRPTX/hajcYjAanc4279
         Qs6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNj73S3OjHVVtBO7cHqpmxqQ3jPfBd1glck8oj7LtRPPGEg+UA3L+XhRfL7y8Wig7mX7x7sfhwkcstXa2WFLZz@lists.infradead.org
X-Gm-Message-State: AOJu0Yylam2NFRjJivRlyZ3aSnF9qEv8f3NQTxhKmWxoKOlA74WSjFKS
	EfsmCQa50wjsyvoXQfpAxbCsu38icpx+b9I5Wy3VbegYgQuknGwz5pm8USEiElueaxYSIcPYGIl
	qNRwYU0wDDQbmx/k22u4VUphgeF1pxpxzhuFX0kHGRA==
X-Gm-Gg: AY/fxX5yJ31ral1U7uXDU2gJoxXJG8LpFLOnC1cQ69U78Sz3t2AJxWbaCjjTIC4QAwx
	CeHIcnxWyCPb1WK8I4e3hbUJXQ/jzZ1QCtDuLIwQyHAAB4YAO1oTZZjIliI5CC21fXKDRYEo8ch
	PZNgvK+lluNish6NVUXDoNSeGyywNHghXhFoAssl7Dc4H2CChkAEYENHhwXWnENOObQOBWQO02i
	9N5ZjQ6VbfnWArNuUGRE7o6CHpOBA9FWjw6VWWoDJk8kPNeYmlyjjM6++LdDA51d/JmT5Jz150b
	Te/GviNGioBBo3HfCt7Qijuh
X-Google-Smtp-Source: AGHT+IENlmR0sc0Xb7DhLwn0Vq765F8OyXjE3fAqqAeGP9hcTJDm+HMWSnu0fNRLLx3SXw/1GBSLkwKC99ivJnubJVM=
X-Received: by 2002:a05:6402:34cf:b0:641:15d:6b97 with SMTP id
 4fb4d7f45d1cf-64b8e94713bmr224102a12.2.1766080222160; Thu, 18 Dec 2025
 09:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
 <20251219-pgtable_check_v18rebase-v18-2-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-2-755bc151a50b@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 12:49:45 -0500
X-Gm-Features: AQt7F2oazAcKk3yq-_8d8SYNXUmWrpPknuvuaCQSw2vGEhneFPgafk9uUlx-JHE
Message-ID: <CA+CK2bD2FdFdM+=tcvf6L2x-j=b4HnixUwf4irWp-eNwQUeFrg@mail.gmail.com>
Subject: Re: [PATCH v18 02/12] arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>, 
	Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, 
	Nicholas Miehlbradt <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_095024_522986_7212589C 
X-CRM114-Status: UNSURE (   7.53  )
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

On Thu, Dec 18, 2025 at 12:10=E2=80=AFPM Andrew Donnellan <ajd@linux.ibm.co=
m> wrote:
>
> To provide support for page table check on powerpc, we need to reinstate =
the
> address parameter in several functions, including
> page_table_check_{pte,pmd,pud}_clear().
>
> In preparation for this, add the addr parameter to arm64's
> __ptep_get_and_clear_anysz() and change its callsites accordingly.
>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

