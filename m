Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A1CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 09:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=; b=0qoLLijf50Ova+7UeCMp2vJAv0
	Cv3/Yq5YYNSAwCvs44YO5/RrKBccZmZIfO+oFV2ymEJx1Ny5BPPe/X7bmY3o73Hpb7uyqXpY95ooo
	eWF6qy1Tc+TOG9dYvfJrqDzEba/hBTzNz8ZRdJYEcPbo+63GJc6y8n5vp2miIRZop9KcxUU5uabxV
	7REOIir6nBB5+N6Mb8AtzxxnuFGS6CINGGAPTeBszYdC2zYoLiX42Hz30zRBs9BYWHyloyLVEkH5b
	m2/Uir8mWYgC2V35vvMrDBkqoiFpSE0mnMo9RTgtPCCJ8gmEradd1HNC/5W8rWFOBymtI6KE988qE
	CSez1+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSrE-00000005GCq-2w2k;
	Tue, 18 Mar 2025 09:03:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSjb-00000005Eu0-3ZJG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:55:40 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso4047531a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 01:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742288139; x=1742892939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
        b=FpMitZvjVb1eU64Ac86GOqPA+gHxWQSLHGsnt5y3I2G/0aFIdKHtV4YEWDXKf8bikx
         QIEFyU5dtvqwbWaGgLhUFgxn+03ejNzVR47ieBB0rX+UWCR58adVg3qe54DskCNkfdsb
         0/RTrWP/4NCcD4ti8TrGfYbiDbB8I5HOHB4DPupuDVdmH+3EYKYGzGzckvUzPk9y4oj6
         8nMamWOUfS9MIIDV+RbIwtCHZyJB8WLbeE7rrYZVgJ0V9LXnFk+hc6N+wgtnRN2guX80
         oDV5DjdF/lIgRYM9cPyCNKSR79kz76pi5R+hfvdgUCdgxiU3/9qhQIP1eeSdEO46j7HD
         L0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742288139; x=1742892939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
        b=GgQKRVGn7hHAfitwPyL9I+mJKQU37PJ+otSj8jti1TLLGcTh0SF4H2CR4jfczZc0RU
         t2qR42SUb5ovH8G6m88ECsaOVmyHYVUu1bIQV8y6fZPcg1X1maYxK9Czue9giPzvAkZx
         dhYjjetM9Kv2S6oSVpgtBXULNetgcOo4ls4HBoJfPM05PSUUBnW2iegYJPb8glIGuTa8
         Ii0rP9i+Z9xIKaKHR2kIkpbVUgIxV/URK06aHRgd/CUoTp7ird8N6lMrUjDwbDzj35SI
         JbGtS9XHOWPCPjzDakd0gmmLX9But55npJU+YlH+dGezgJ6eAfF0Uq+vFqpKZnFuDqxk
         eJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQveQ7zV0HOMEA2vznnlcnfGyT4+ukpSjjYdHTgYXWOv5xbAIxbRBSCYfzzIzBTatll47efZ4aM/iClWWSn6zD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7RRASPRbi2WnpkwarrwI6dVf5c/NIm0KhPFupTTeg+7pQ5LVg
	zotSqz4bXdmD1UkET0eqxKDvESd2wJwFcy0kBtAngoQpc+IPXLvVaNM7nXpuWCNI5+646mxcJhC
	pBwEGcRZnvUyzOJk6PJxk6S7+cco=
X-Gm-Gg: ASbGncvb/mgig4j/lEgn226Lq6oLLwfIjkKlTLGJWehVrVWZiYA2c6tseqvwy+bVzcC
	HJrHgV0ulK/SEt8oMkuYAhPgX5ohfROVcRNfv4RdkIzVtXjRobfOpMjYR/tb/fhv6I2zKYM9Wbl
	Je1G5bVK/69b2Hd5b+j6w+Fdo=
X-Google-Smtp-Source: AGHT+IGzUXTMu6+0f6gQ8j7WPO24H14DLLXfhIDYppHhvCBnMdLnrdfvlyQcetDDzARbEXc2mLoN0e/rL5Gkqv0Y5W8=
X-Received: by 2002:a17:90b:2250:b0:2fa:603e:905c with SMTP id
 98e67ed59e1d1-301a5b0441dmr2305847a91.2.1742288138990; Tue, 18 Mar 2025
 01:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-4-robh@kernel.org>
In-Reply-To: <20250317232426.952188-4-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 10:57:11 +0200
X-Gm-Features: AQ5f1JoW0JUop4WUBf11_vConfYpr4BhM02aAcWePKMPfEFMJ9UWB8ZNiBwcNWg
Message-ID: <CAEnQRZA7jEA0V4T1JSam-vV-GcBAbynP0PCfQsyejScwdgd3pg@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_015539_886797_1D68885C 
X-CRM114-Status: GOOD (  13.16  )
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

On Tue, Mar 18, 2025 at 1:25=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
>
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For IMX part:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

