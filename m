Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B72CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 00:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Message-ID:To:
	From:Date:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IZIC9ZMMzvGrvF0OmZCjOiyweVCbNABwWgwpKpRgUik=; b=lJzMOmN9ONif0a
	iD7Ua7ZwIlA0me3B1BwOMjl2oadyxNbL4Err3s3lAuHKYiUAGour2gUpCtVDDtqFzyeft6iRmtYn2
	3rK2sFML8fZeRj990DXzyKdheUsHIcLnYcnTGtU/eKJTUc3Z53We6P1NSoU3VTsXcFt065wQOPbZ3
	oip62NJlx0X5IDRdANfgFSvYQrBi+kzB9boEpxajB/fBbD6j4ZescBVJ9r9ahitZbewEaGSVHICra
	Fwi9rDn7oGqpai4R8HPZBfJl9FsGouDfsLsQEcaDwudDCaSRbVH0tOaK+W7YB1crf/CCQ3bQ3iGpj
	LW0hhIUbIbyOY65t6rJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1DSx-0000000FDo0-49xC;
	Wed, 24 Sep 2025 00:34:39 +0000
Received: from sender4-g3-154.zohomail360.com ([136.143.188.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1DSv-0000000FDnE-2YGa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 00:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758674075; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=S9XjC6WVw7e+CUm2Ebz6YIpiWwSPRBDNz/1SnzJAAFp3cixwCNlkYZRqEPX4YbDldCDShjGVOt2ReBCDvLdsSYn/73spbhSgZvw5G4lf5NKoN0Q6y96YGjl4czaB15vII1m/JrAzwVR0pIqXnKLdxBCW/XP0WpHek6QVnNsevuM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674075; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=IZIC9ZMMzvGrvF0OmZCjOiyweVCbNABwWgwpKpRgUik=; 
	b=PUUcM77Xj/VDvPmX5qR4AWxBfm3DIGyTz7Jm/2N9jXJKCojfPHQXy4nEsPqsW094H1my8jSEVjqLjlbeM6O7PEI2SqbkEHgYPHriO5Dc6G4zpCKGt9lhnZQPev3KvJKYE2BZC3jorx77sT1/+G3qpZ5Data+A1VNgMeCpNthbVQ=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a5b06a0-98d8-11f0-ace3-525400721611_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671652858579.973687164522;
	Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=hCXHAeqk1pDeOlLtDPYKrPtlrn2T6z3nu8j/0oxfO3g8oKZx0XtRfFGwRkvR/Oyr3fWQStyOMpPOwb4RW2WrApog90jb1MLEJOqHZaauD30YXVxX7yptVeFdIU6cFJUF5hJ8/8IAQg+ob7HKEP+y5kthx6es2bfzSvNWSuAtd3g=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=IZIC9ZMMzvGrvF0OmZCjOiyweVCbNABwWgwpKpRgUik=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
To: linux-arm-kernel@lists.infradead.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-ace3-525400721611.19978ffc40a@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-ace3-525400721611.19978ffc40a
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a5b06a0-98d8-11f0-ace3-525400721611.19978ffc40a
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-ace3-525400721611.19978ffc40a
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-ace3-525400721611.19978ffc40a
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-ace3-525400721611.19978ffc40a@zeptomail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_173437_670239_522032C1 
X-CRM114-Status: UNSURE (   3.19  )
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
Reply-To: investorrelations@alhaitham-investment.ae
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

To: linux-arm-kernel@lists.infradead.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

