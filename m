Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89448C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzDN9dmdAK48wXWx0awduq7CrBP6vYP35O8PwR+e9qk=; b=TP0aYwnIm2XWfHn0b5jXdjr7HW
	YpYQvQZrc7vrgIYcbxdItD4V1iDIyHluYIlAoQGr5OHzTEpvdKggjJahRAnCcW1BwYq4gM1/N4OEs
	4pcWBk1qke+Ai9FwXwggu57rrWwxNrYxGNENbC+nv0ZkYcepT3VXAHE6LcAUH0NpTHTloylTmaUR0
	puC/m3TKVNjCoed12WuXHrDbwypNas2YLib7ug825BXfklyuUCrRNq7AZQ3hq/sYzCzjsCb4iRjKk
	ZS/xT2fK1oQ5Dm//eBvRt+0XG3CMNunGOpqgJ+zXyRG1NtAjjs9t0cWGwZ5waknx6p5pXWtz2yK28
	6aWH+ZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYO6X-0000000EkPf-27i3;
	Thu, 16 Jan 2025 11:32:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYO5H-0000000Ek9J-0609
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 11:30:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so454768f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 03:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737027045; x=1737631845; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kzDN9dmdAK48wXWx0awduq7CrBP6vYP35O8PwR+e9qk=;
        b=VEQKyhb11jr0jW1hbUfdd/KIj5asR9z3BUdBgmY+0TWXNM3HXq3gxOn4snKJEEeDPf
         sL0Mx/W1sjdY6w5i6es+s1oJMaEWMnXpCnFuuOr9t+6rt5bb6+KtW4EaY9Muxb0RgXiS
         P4rBJejpvrnWEPTPeW0TNSxRK/lDPpUIkEmOEAvrDgoz17YMZ+78ZMd+uz0dCh83UWFU
         zgjbefwzZwlp+DCJVYuwjFF6r+grH3UQ6PW7gBf+YBnFM/XE3U/5NJlujySMyIJ6v+y5
         m3QCCjcmUsuk/j3JG4dyHl+zJZvzjsPEavQhg8qry7lTP2si9WRRa0oCki/QGqKQ5KiD
         XFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737027045; x=1737631845;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzDN9dmdAK48wXWx0awduq7CrBP6vYP35O8PwR+e9qk=;
        b=wpoVnzfmdfj4gWaqiutnoVUqRVAIxync6LN5NDFTeCfiPgYhD4oWZfspRVm6yV3j2Z
         4QWmLlXBuUk/RFM8MAQU+KwyZcYfGHc+QJNLJvPHLfk/IKcTNmsJvFIb1UN7Z/O4hTQb
         1enNkhKBuD5zp9RZ46tv27clKmuePhV2zSnRyFfMJwnTS1kdacglyg5TK+TF/siWQh0z
         h+pz9nvQb/FRXpTABXQJ8/uPz4gXCpxptxSEf9LGKBJvTJVRMa41OtQ9CCSggUNQWLtk
         OeLGYJo64InPMSVVbS6kzgQo3QhjCw9km9OsYh39FFy0chKPmG8F8jbx5NZ+LUr5Lu4+
         biwg==
X-Forwarded-Encrypted: i=1; AJvYcCW4yelN5rnUZFIxEVwRFdgAUm+MhG32XLZD0ac+Zfwkbr/j6DkG5P3WVcaDVqhoZ8Ir9aqGV1RkYZbZWuR5OP6g@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3fFABRut/hY7Lbze70+GcIEFtD6Ve8cpwU5qV4Oh4SU7GSh2i
	YLmAstXb2dkF9lBnFZeodMYYrmJRfhOkaszEU1so0uHY7p8Dcw3B2S2+oAD+Ixo=
X-Gm-Gg: ASbGncu73ESPep72x4C49bUA/S2jr8kvV6un6HLfr3jz4dGFNFTyDRQfaFKU6VHiny1
	fpxK7oLUAD5d+yfdeChZtBOUPsIY6JzpwMDsldaupWloUaqCR0fPqL1OozbdsJxROmlQWE0Ojwu
	JVipEsSwbdzEKa/Esnh8JDvzsWe/ZY+CVn+CYxg6hhxEq/SU+upIOtzZiAgDFvcrZfsnfoLE3wB
	N98PPNAAtps56UYDU+t2c79puyUM/k8s4eU5Zz7YA/pR0EKUWLviNI9Odmcgg==
X-Google-Smtp-Source: AGHT+IGsW7R8SXZiI21rLVry2LB3/IZkmamq2Z2hj3KPYHeT5ENtm5n56n32F1wCYQ4Tz4sR0OmrNQ==
X-Received: by 2002:a5d:648b:0:b0:386:3e3c:ef1 with SMTP id ffacd0b85a97d-38a87312f36mr34852486f8f.35.1737027045345;
        Thu, 16 Jan 2025 03:30:45 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac707sm55516355e9.15.2025.01.16.03.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 03:30:44 -0800 (PST)
Message-ID: <941c7920a7d07496222e6e93cb338ca6df38dc33.camel@linaro.org>
Subject: Re: [PATCH v3] scsi: ufs: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Mike Snitzer <snitzer@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,  Eric
 Biggers <ebiggers@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  stable@vger.kernel.org
Date: Thu, 16 Jan 2025 11:30:43 +0000
In-Reply-To: <20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org>
References: <20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_033047_063410_8CBFE7E5 
X-CRM114-Status: GOOD (  10.22  )
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

On Thu, 2025-01-16 at 11:18 +0000, Andr=C3=A9 Draszik wrote:
> Changes in v2:
> - completely new approach using devres action for Scsi_host cleanup, to
> =C2=A0 ensure ordering

Just repeating this again due to updated recipients list:

This new approach now means that Scsi_host cleanup (scsi_host_put)
happens after ufshcd's hba->dev cleanup and I am not sure if this
approach has wider implications (in particular if there is any
underlying assumption or requirement for the Scsi_host device to
clean up before the ufshcd device).

Simple testing using a few iteration of manual module bind/unbind
worked, as did the error handling / cleanup during init. But I'm
not sure if that is sufficient testing for the changed release
ordering.

Cheers,
Andre'


