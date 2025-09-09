Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293E6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyQrVgT/DRDk1flErmNG0zRfCzOEya0nPwf7kHpzdv8=; b=PLq/nd5hPqtU6QfIgBcBT3camR
	jtSGg8joyLu5gmxY7u7xQG1T3iDiK64iiBiYgTUyG7VXEFc3M4ksWRD5MoiqkwS9CEUYd4skeKdqV
	1YJZxKb/s6LlcOTSuru707sZNlPqJ3A90zfWa0sOzq+/ciGIePW4CP/4s6blFA82fjKQ8bvX0pHcD
	NAKslrqD7K/1w/oPsS8hL5mAeWxXg0et2nOb3CYdgRuI1Vqr4Jvt6SUrR09/mhH2KPN4+AePd9nS/
	RuZGvKqRDY3OECKkSE8C0ArMSKmePCYbErdm62UvmJFEluFoxG10PXErlqx6xnOlVFyV0zxK2lgAu
	wyinXMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvPS-00000006Jvs-1Arg;
	Tue, 09 Sep 2025 10:17:10 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvu3a-00000005hAK-3j46
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 08:50:32 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4b5d6ce4ed7so1188541cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757407830; x=1758012630; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iyQrVgT/DRDk1flErmNG0zRfCzOEya0nPwf7kHpzdv8=;
        b=g1Qa/gh2/R3VneNdL24AyrHd2/UYrnqQA33rHHL+dEbhTVX4f0xgp0o7mntCgY/3w9
         Rh/Vsjrxp08n/SRIfGCfI50RrmJLQlyc5WO1ooL+g0N8zG7qF3071Nt6g6ZLzi3BUNzE
         zHGJgih1dJEoxp5dwZU0+CNdYVWe7uFhirThHognZzFNYlbCX9KqqCXM6KJC0OHQcILI
         P55Hb/BEhBnf4DcOzRtbOnTIj9lLcJQKwuoliMTAA/PZDlBe48+pIMtw8AYYuJECnSLG
         RDhIo93B0E0RHzZAnj0JvPAEcnUH9CoLmQrG34bJZXAjx/Q5EbczPy1SOsuNtWDQF4Yp
         FbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407830; x=1758012630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyQrVgT/DRDk1flErmNG0zRfCzOEya0nPwf7kHpzdv8=;
        b=ex5id9FiNnofuistiD205dAL8grnAZYUyyr/PpJuhzcVgRoe77hdD1AJ/9agByRa2D
         i7a86lt5Ht3Deo1V08kKReJyLHNAupeUEH5yAeYlB25Ezp/9cHsoLTA3c8BrRsiecQKD
         cEvfs/spfz44R2ZbUls4JRYucRamkURtCiTm9x+qpgv27sgvcOziIlJ8JpAehkj4zUrN
         5eeFOJqlnMtFaooTlhKFiSqsJzI0m//cVXBRVF1ngnSnex9tSjY68+RC/vAlTdoqyGY1
         DJc2wYFSiJtaNIZfrLjjrFcSj3nHU6FGu6EWRVj7x/A6Rj4mM9sh9uFsXHP6Obvw7XzB
         IeYA==
X-Forwarded-Encrypted: i=1; AJvYcCVStj0Gz6Ralcp9einQGjADcMgxWVWd/BZ0tMrEB0yJpuw1fZXIHlmyfdmBN2WIUpksvEa7htr2MqL5Zcl59eAo@lists.infradead.org
X-Gm-Message-State: AOJu0YyS0CwoSKRowRCZV/iYkHK3AK5GweIVssZZCnFF2XiTo97uG4EC
	JSFYCzGxukHrTGEFpH4cakDK40MOxFNQlW8hd3Ey66gNG9EX5h6B39ncBat8t2VWTEJEpvah3Iy
	UdlaqW86msh9BkTjUkRThbkduSb2GvYq/bpgaMdb6
X-Gm-Gg: ASbGncsN5Jap1JAgS47iLre0i27A4gDj5MT+XInSMNSRIn55FrN29E9sFhvkNKbDCxp
	diU3ncasmi21PAj80EtQFEpMGxjBO3LQd/ijcQdcBcsPPZzrSNwChuDrR8VzjKz523U9ztjzrRm
	7mvGQ7ed2HNBHAIMGj4heGhv1ZWst6kWeoLQW1IrWYLfZSMUyd19AzPCiGavaITHQXKo4+N1uKW
	7cnOzbAlII6Fq0=
X-Google-Smtp-Source: AGHT+IHiI3JXPX6IbsbQYAgKJcPHbcd79MrxwtJkz+hhWiamNDxhM8IdKcNuI6OeSEaIUOp1gEuys6yJXscaruEjuio=
X-Received: by 2002:ac8:578e:0:b0:4b3:1617:e617 with SMTP id
 d75a77b69052e-4b5f83a4782mr15526561cf.11.1757407829304; Tue, 09 Sep 2025
 01:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250909072323.4106202-1-tabba@google.com>
In-Reply-To: <20250909072323.4106202-1-tabba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 9 Sep 2025 09:49:53 +0100
X-Gm-Features: AS18NWB0DvPmFi-qUEdQUC9WLPdPZweoYYOUsOpJ_ZmY0_5YIMF-ZkM-TNKvlxk
Message-ID: <CA+EHjTy4fZe-Naj3wX8gZ3wTWvkAmSkEWqDfnmHcnp8T7Kz7OA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: sysreg: Fix sysreg field definitions and
 generation script
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_015030_939755_52A1926D 
X-CRM114-Status: GOOD (  21.39  )
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

I sent this cover letter out by mistake. Sorry for the noise.

Cheers,
/fuad

On Tue, 9 Sept 2025 at 08:23, Fuad Tabba <tabba@google.com> wrote:
>
> The sysreg definitions file has a few errors. In Enum Security,
> NSACR_RFR is set to 0b0001 instead of the spec value of 0b0010.
> Additionaly, the sign of the Enums DoubleLock and EIESB are wrong
> (should be Signed and Unsigned, respectively).
>
> Moreover, the file has some redundant definitions, e.g.,
> RCWSMASK_EL1. While these redundant definitions are not wrong per se,
> they add unnecessary code into the generated header file and could be a
> source of future bugs.
>
> Fix the Enums and remove the redundant Sysreg definitions.
>
> To reduce the chance of this happening in the future, add validation to
> the sysreg header generation script. I didn't want to go overboard with
> validation, so I only added validation that would catch most of the
> errors that I've seen, which also are errors that wouldn't generate a
> build error later on.
>
> Changes since v2 [1]:
> - Added patch that fixes field sign definitions for DoubleLock and EIESB
> - Removed whitespace fixes from first patch, since there are more
>   inconsistent whitespace use in the file, and fixing it all would lead
>   to too much churn.
> - Collected Reviews/Acks
> - Rebased on 6.17-rc3
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/20250813164506.1203851-1-tabba@google.com/
>
> Fuad Tabba (3):
>   arm64: sysreg: Fix and tidy up sysreg field definitions
>   arm64: sysreg: Correct sign definitions for EIESB and DoubleLock
>   arm64: sysreg: Add validation checks to sysreg header generation
>     script
>
>  arch/arm64/tools/gen-sysreg.awk | 20 ++++++++++++++++++++
>  arch/arm64/tools/sysreg         | 18 +++++-------------
>  2 files changed, 25 insertions(+), 13 deletions(-)
>
>
> base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
> --
> 2.51.0.338.gd7d06c2dae-goog
>

