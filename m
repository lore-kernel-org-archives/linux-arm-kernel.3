Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692C8CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shyQnY3YHWfiVFVYpdQzZRY/aKcQtMNw7xgIsZxMDkU=; b=hkkISvkjP4TK5AsoMq4m2qw/XM
	l87Cxybio1iXaoyiFc5h/pK/CzOeRD6X5cJuz91xFPH2G4oNlba8IvcDuoeZgtKtpBMN+dCPhN3ya
	uJ1jt2fA9WYnkw259t+xcgL0taECoN5074+yWBpCtxjlWiOQ5sf3y58Eybslh5eG1gUvaamO62QtW
	towkr+1+7LwObQWGsG/bOJXeSoQ6VzcGFfFTbTa/LJ6E18U8w0uayFjXd2aFw33rrRr+uRef7FcjP
	qLqB2WJMQGU52j3y3KY8xD4qt6ujqLCq3ephhUmOix7vSYlRCuS7gyxW1MSKYEZpahaTCguN38Pvg
	fWktBWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNnv-0000000E6Qn-1Vyh;
	Mon, 27 Oct 2025 14:02:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNnq-0000000E6QP-480Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 14:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761573749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=shyQnY3YHWfiVFVYpdQzZRY/aKcQtMNw7xgIsZxMDkU=;
	b=BzKz6nUKcUHLqAQG17WkfHbpxOAfvbSQq8e7ywRla27vQVzR/ELGcGz2B6M/jrONbWxtnG
	xBQku+QgkqRGlGZ6py3rShCc0fFpe47/nCMnyNWIbOi2vMrDcS69KjZNbkZgx9+1KW8Jba
	l4WMM28on6ISOfStEEB8DmNVzL7rS3c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-N6SEJ_JuP2Ocf030-5Ow1Q-1; Mon, 27 Oct 2025 10:02:27 -0400
X-MC-Unique: N6SEJ_JuP2Ocf030-5Ow1Q-1
X-Mimecast-MFC-AGG-ID: N6SEJ_JuP2Ocf030-5Ow1Q_1761573746
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-426ec5e9278so2892986f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 07:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761573746; x=1762178546;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shyQnY3YHWfiVFVYpdQzZRY/aKcQtMNw7xgIsZxMDkU=;
        b=t4Cb7d2DQZGTNl/3zsLSUnBxzLFrFSeNsCslHFY0ZhhVkVR06/B9j5GOIlNaTfDxpp
         xPnWuz9XM/HqUJWPurc8jJ13/Hv/woAVeeRIWWqkZpvHH06Bmr8kP4sCg5h5cUL7hWaT
         fKuRlRAuYfk6ToASCKh2h7eEnlAOQEF7GttEtaDVC2/+qP8M47ckKGJz8Akki3nkySHD
         Sl0VVDMzppIWdRb9LS6rnfhIGA93BLdKr7c63wQkLtwiX+Cj7/Nb7e0KHrtG03cXBIc/
         fG9PStJ55RQMl1sLTDEzZ41KwmQEWvWpcCMMVgHYlkXtOYMXsBgDFuPm39tvrzDA1lOM
         JyrA==
X-Gm-Message-State: AOJu0YxMkV42lADZL6MK2qzyIb++/RFJijtfbHuF+EoauDfw/ggNLDsw
	K/r4vIi+Bx2GfUmv+x92Zhd1enWfn9AkrXJoumBmruFwW9vHGGaEzEhFudrR/wyjFwEuLGZsqDx
	REhtiNTDIrARGRrXuIOYuROrBiu0v2d+IylSCOFFDu8i4FJ+eEaPYbORukSq2Ibliyf/PvO54zX
	OH
X-Gm-Gg: ASbGncuPQyZYPV/uVHaggyxcbHPI4cKzuAmQcnBKDV1FC5xslhAxvSq2NoEZ8oaBugd
	uclLNxavnDeMfaO16DcCgf+hZH35gA2ZWcnvYsN7aS8LTiVE1F4wa0hGtWvlDB/ulJ2E8++G6QW
	QkWkAJICSu21J+Wq7MJjqPP5BDwA3CkgfgnIMPcERRXxFZ+0hGUjAGuHmbRbONYfU74qE7Odc/y
	K91uH7Hr9SfoAdEvNw0fFRUEzd+z2oNjAkr6bnHMf5n6PeMlNMvriiHsavml+IiVQL821z9WmkN
	cD5daaPUNZvkTNyc47MQqZS61RTyvjVcIPvaESPWzv872RZDFgIHuZ3dXc5FhRsjsIe6lJThORh
	5uQ7v51/fb48e25g/bMGgwvrso/TMf2zVL1kYNbRnDEnBrp0T
X-Received: by 2002:a05:6000:288f:b0:427:a37:ea3e with SMTP id ffacd0b85a97d-42990755b87mr8916533f8f.52.1761573744786;
        Mon, 27 Oct 2025 07:02:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETyCrcEtLcl3q6Rbfg7qOzwYfycn5fPY5jgI68IwSrW44NCEA1DZHmuz8NQf54cnQJ3dYQ8g==
X-Received: by 2002:a05:6000:288f:b0:427:a37:ea3e with SMTP id ffacd0b85a97d-42990755b87mr8916495f8f.52.1761573744177;
        Mon, 27 Oct 2025 07:02:24 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de. [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm14242478f8f.4.2025.10.27.07.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:02:23 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:02:22 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>, 
    "maz@kernel.org" <maz@kernel.org>, 
    "broonie@kernel.org" <broonie@kernel.org>, 
    "oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
    Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
    "yuzenghui@huawei.com" <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: vgic-v3: Trap all if no in-kernel irqchip
In-Reply-To: <20251021094358.1963807-1-sascha.bischoff@arm.com>
Message-ID: <e2d3e614-4e5e-7ad9-5cc6-867d85dca5c0@redhat.com>
References: <20251021094358.1963807-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dc9CeULW72ogq1ekmHaUa_eH0qqA-QpM_pjFOWMZ52A_1761573746
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_070231_139885_F4268812 
X-CRM114-Status: UNSURE (   8.45  )
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

On Tue, 21 Oct 2025, Sascha Bischoff wrote:

> If there is no in-kernel irqchip for a GICv3 host set all of the trap
> bits to block all accesses. This fixes the no-vgic-v3 selftest again.
>
> Fixes: 3193287ddffb ("KVM: arm64: gic-v3: Only set ICH_HCR traps for v2-on-v3 or v3 guests")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/23072856-6b8c-41e2-93d1-ea8a240a7079@sirena.org.uk
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


