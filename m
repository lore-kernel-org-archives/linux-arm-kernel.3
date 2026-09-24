Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9039FC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 01:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WltkXwT4z+eov17Qfylxi2pHojB612CmH3f4OFtUAec=; b=fAKN/zMj9I7PNIR0xHqiARGezg
	4tHUXBm4iJ8QFsIFT8Etv3j/XH5gnhAlVYQaGHSloVwr7NoCpsyru6TWbm1wSBTQ2fW+/cJu3gcI8
	bMa1LW0NdwkHZZ+f2n7sR59SO4SEdeRH7kR3lU47+MPkmC+cprQpzqYA2aQ8ZiR16/Qi6FrGsCR6O
	NN7EbvEnsA015uZ6WtY8PtDpb8OasPY47pbMGVzXxH+5RSZe+Iw7CwiMyt4W2I1kReFoqVTJ4ku02
	cG5vRu+7l5F0mMXj+qdU2+2xEi3yLuIcewoHAVeS7An5hx9uPVyVADAMqfJp8YMPpWbqZ62hwUrtN
	JD1If7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YVj-00000009omw-1sYA;
	Thu, 24 Sep 2026 01:44:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YVh-00000009oml-3DPu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 01:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WltkXwT4z+eov17Qfylxi2pHojB612CmH3f4OFtUAec=; b=JVZNskqGQ8IOzDmafqXigzjTd8
	xXq2+NGPdgCA/bt7Uky8+cEUgRM8ju0+vCf/xL3Dv0KffwU/BU4LXOZUydoGRqGOf2rbgM/hHrNvM
	KxrsCpbhuIx4JY9onS/ZKJXYAx4En7ggLMRDVTsMsFbNWLbTFG1XuL0aK8bdbq9gCtGpSXZ5k/kFp
	8QMfj+kvS4aZflqeuF+0YrC8m9V3/RGgFXdw33VFPj7zvBiX2Vfirlfrcgz4onqyZ1CFPZzuJXHcx
	kayqOo7H2gDbk7SzkOcSL5QWHGBkmeCRakl26EpFetXDI7esxor0Bk0GzFw4FIHryU1l1WZWeomj7
	Y2KPrKoA==;
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9YVd-0000000FRRD-3tn6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 01:44:27 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33e62211987so1766277eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 18:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790214263; x=1790819063; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WltkXwT4z+eov17Qfylxi2pHojB612CmH3f4OFtUAec=;
        b=YNyiiKqbwTB0VEEsdWzBtaOtWPQ8aFntzWVcWx2YBXQfBhzuSxE8HY5NXBan1XfZpN
         bpRWAQzqjlZGnzbMpyUIBmrxJgT0FXkIAIUwbKJ2ZySD9a+ikYk3GKnj6GbyD8SfCrCK
         yUkj1c5tdOxf81ynk5cimraJ/LtxH99mtuVIBTiP+9W6K5tDQF0EXHymbScNNUKThNaF
         B2eZXI00RwHff4znMGiiHFPJI26KKF+fqN3V8+io56KVCP5Qv0aJVjPxWKRrLpU2KVEI
         a4CKRknD7IONUI+WMMn1PFfQlPrEbYZWAJwG0l9O5lp/she/veGIy/IazkDxs0M8aFuC
         dl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214263; x=1790819063;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WltkXwT4z+eov17Qfylxi2pHojB612CmH3f4OFtUAec=;
        b=yBjPsQKy543wwU7xRE7Po8zAYp55a5791Cl8OBjPYt2qIJSYI0Dzc+awA0yjVSXXY8
         xCFtyyTTwGwUoNDcYqw3QspxFRpvussdYx5r0jM60fxvG5iylhjoKEeZKYcStC+hzfBV
         /Ah9IxSSg5k8aXebC+yg3tamInXRDhuvE4cPTcvv8t6iYFqgSyLJIFrep0memHQpZY58
         k5jpZA0PjFkwi8E3vixFK3/q0loWoofn5AHv0yYECzu+u3CEyTfQRzrkcE5jqFaUQhOW
         5TYS04TWJPJ1sylPlgAJVTDy9e7SO76QslzOyh/HSlHtPyK7n5AXuLaKAPQJfmvzuiHu
         /Hfg==
X-Forwarded-Encrypted: i=1; AKwUvBxl5vvWecPbFHT3l60df3t9VSvyRs7JrEXDp2tqileu71d9YDLkwirxN2Ye+3ObaBGoEVNB4CHjxaikF9T4f8zJ@lists.infradead.org
X-Gm-Message-State: AFuF++kD9Ogr/zODPIdp0B6wKFqjuMeGexwcHqzuURXlsMw7ZTMmvdjH
	sUO9PP44tj2nHkxcQb/+IES0zZOXMrUe94i9VAMKNaMguC32o9V/iBRAKM/niR9KtZQ=
X-Gm-Gg: AYBFou1RJW99hBGc4yAw8PD7OrHV27lEe73nrYHgGJz9RAh/JC0+X1oChEZqvE8uK3Y
	5HzS5At0O9f1mbW9XFh51sU6A1wDdWNofIQbELaSMY1IJ2nIVAG3GK2ZHxGSX2j5Rv7EqgSxjIM
	Zt7tbbkIPvD2BwLr0KWgnL1AKsR5eKUS2ERYzxExYg1xIrZa5IS8S3vQY1tiMQ3pJifYBlrZ3ce
	nYdPCkF79C2ujKEZjbL1KyWEXzGFYYuSTNnzEtPqx+L6Vw0mf0G3gDglnpAa/b/zk3zlz0e3jQR
	pP7pkmk/cicE2dqwT05eyYZ3bm4ml3ju2ZPz1WmqdILQMmcy1JOAWrQxXYmKidhQVgZyIFKa6AS
	J+cb478NDApAEBgOkDBdC0YwKuPOywiNkOjzUBtuRYs/1yNLkAWoYL5IiMbm2i2NxBdunWn9YPu
	auwhYVQz6+z3tMugKt1rlJNzGUg5PTfKEseKAJ5bDh8uXeqWFjE8Twod/ZxvD3EKbxxvbQ8bTzo
	mI4ein1vQ==
X-Received: by 2002:a05:7300:238b:b0:33e:451e:c8b2 with SMTP id 5a478bee46e88-34006f826a1mr891609eec.37.1790214262980;
        Wed, 23 Sep 2026 18:44:22 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdabcsm9920817eec.3.2026.09.23.18.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 18:44:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 18:44:21 -0700
Message-Id: <DLN5ZQ7GWNQU.3S23BUADOK8M@nexthop.ai>
Subject: Re: [PATCH v5 1/3] i2c: xiic: preserve PEC byte length in SMBus
 block read setup
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Raviteja Narayanam"
 <raviteja.narayanam@xilinx.com>, "Wolfram Sang" <wsa@kernel.org>,
 "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>, "Shubhrajyoti Datta"
 <shubhrajyoti.datta@amd.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260921-i2c-xiic-v5-0-2fca81e810ea@nexthop.ai>
 <20260921-i2c-xiic-v5-1-2fca81e810ea@nexthop.ai>
 <arPW6xckt7QMpt7C@zenone.zhora.eu>
In-Reply-To: <arPW6xckt7QMpt7C@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_024426_165132_5B963093 
X-CRM114-Status: GOOD (  10.52  )
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

On Wed Sep 23, 2026 at 11:04 AM PDT, Andi Shyti wrote:
>> +			/*
>> +			 * Undo the setup-time padding before rx_msg is cleared,
>> +			 * so the PEC check sees the right byte.
>> +			 */
>> +			if (i2c->rx_msg && i2c->smbus_actual_len)
>> +				i2c->rx_msg->len =3D i2c->smbus_actual_len;
>
> I think this restore needs to go also in xiic_recv_atomic.
>
> Andi
>

Yes. I2C_M_RECV_LEN forces standard mode for the whole transfer, so an
atomic block read hits the same padded branch and then completes in
xiic_recv_atomic() without the trim.

v6 pulls the trim into a xiic_smbus_trim_len() helper and calls it from
both sites that clear rx_msg. Patches 2 and 3 unchanged.

Abdurrahman

