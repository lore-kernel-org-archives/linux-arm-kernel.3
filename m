Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC458CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 05:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=; b=n5R5FQbx7wBCeU3RYzXIGJlQbo
	MNVKry8FdxLGJmKeGVAhy/+RILRoB1WABHmaSfxz3D7QWU1o7DN0whEzLKaA12T6yFrX5TNvM6AxZ
	qM01YDLl2WCT1L3P+s1OkTlObNKMLvfHnj0wzYbQHl7Sy5tjrLf9qjpUAW1QmWJC4dAZyilLh4U1R
	m3iF7wb6micDTMqtJMjiWGQtIepjvr9ScXPC+i5gIufA9NjrzsAvzW/rQjUCqiMHaN2XHMYh9Criy
	EG12Iu9X5pmRcD4jP5yYTwuEMlyklwLr6eZCxakInedMb7GW+MMMbOKPCRoho7jFbdLcuAqJ2C0gu
	tENkF8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgK3-00000003X9b-1Hnq;
	Thu, 08 Oct 2026 05:05:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgK0-00000003X92-16Ub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 05:05:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BVaO1775356
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 05:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=; b=bSVN6W3xVa3Sz4qX
	c3SSDNvSwbExIIJAp3kqhcBF9Cgit24uSAyrZVjVhQUihmjoCXse6f7fgNqsCqOr
	Vdsm2XIvw9TQ1IM/ulMvk21CA2o1x1B1Lkuz0/Iy/iay8LI2WzVdSyUJjMucuqUN
	5zmMQq40di2qTgMPvBMPpmWFL2pXi17nmjLioNS+eNsezstjl4JYBDx9+Ab4DhSn
	8XfG+nGn2AclO6juaFAqupxRYhJROqSMKfcj1hSL2O849rw0+MjUrlZUcjVy14sP
	nOV43rUTDd5gTcVdlwheSxDeyjcsriQyeVD0Woi946OBryiJnRFKkkY5XIEqkXmS
	fXAROw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe394x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 05:05:35 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67697e6dfdcso10227684d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 22:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791435932; cv=none;
        d=google.com; s=arc-20260327;
        b=nOTTFhU4rOXihLiYbWUyMBVDfTNNbQEbk/c0lAjGvR/UFaYME/cUCi+Ow3Vbib7+7d
         Y870VeB1erLDV/8KvBoLxe7T1PuC2AJCBd0fis/mH7AVZJ5qDFa/D1dE5ZgaStbx1I2R
         rB0k1eHQob/TBbf5DAlCKgNHvrfNPG0yuVlkDmbYyYeJjJgKbbPtdgwd9W1J73uvYZLS
         V8r9tP316LgXHUmwG9MmjZglr5iMSzK9Eorz3PnlJYLwBpdi0GNKDJw111IaTT8lW632
         6u/dslDJXnI9lBlZnyVYzotkYekm/J5avTfkWFy4eC6ekuJWJLDGh1fsq75B4Z+cKGPB
         ySPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
        fh=jMYlSCT/+CYz9e/sePTcS9QRmD759vrW4IBO2Wk4hrQ=;
        b=FVNlzn7BConRNQc0niXVfFi9SiWk6sD/lQt7OptAa861OSKMH08CKoKcVV3GTtFg8D
         gjdSzmCYnYBfMpm1VgqKaOWrDe1bbhuBfpa4wlC4lwHTHinil7ZQ6h7sIUu3qG2UJ+nc
         wTBGSukoibOUv7otmW7DftyeJB12I13hJB6qLeEfb7pJxeBEW1wy7HAVGzz5KiCV+RFw
         EOk7kuY4MZau3Quq+Jlke9XVAna8b0ci7hJJbjFVzgVaAqZKi0JkG1q6QNoqm3bo9U5T
         w3Dxf96t54sw/gUZG9WJ3PAOBOlrclaHImlG1MA0AxrJLkUfUY3+uHlFteA71GBqKu7y
         OUgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791435932; x=1792040732; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
        b=g4Cm/Lrf1VgWN2CCFMlTsr7CJhsvpxfOupUx2hIf3s5HKT93/eR5vgD+TB83P3Nw46
         JxtqB6bdmSIR2Bh22XTMMCjZCnyoXAN3O8nyR2Y+ZuGjUGH5RT8XM8dy38ee077DkDrG
         YcTiU/1xz/LMvZx4e7o6VnnySW0048sPD/o69h1R42LHPSJWyEbbl8jTJ86g4yfKX7Py
         Hj4rrdRNbE9762NSM/nlW5iJgqrqvT7QAYLJHX9MTpgE2zJT1v7y7hKqzt/9z9QFqkno
         esZCvoi9Hr5K+6g2gKQdkHB5JSQk0a8hFyIHUAV2+cPk/TNbpRJW1Uz3TMuroPSYC27g
         i7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791435932; x=1792040732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
        b=MDKsUQ/+VzgWtY56DHyI9vm2AYDOxTpNJvqHXtWnRwazgX0ZhQ6qXg+St8KUXyJIp5
         +TJO+7AfgwS9b3rKtUjK7Bbk/YWaRZgR9ulqNEee32pMUVJqRFYPyiiMRc/mfTDAJLnz
         jUZzkzOuolcLpoXGL6GH+4IO88NKDKRQXlNvLyaP2UG0OnUHb150DRDmKMkMusX2DDxV
         HDxvqo56VYsphGv9da3uH4fdFMjN4gMBnSP3qgbMip+IvBGlG+vagEMtX7Egloc0sLQV
         UHXxS/SHasMjYEcBzR2blUJro0O3GPVZ/waagCBZk3WnV669gbq6W8QWgeQBI0Onwdtt
         Z5fw==
X-Forwarded-Encrypted: i=1; AKwUvBza+JJessC/Yff91KGUfC5EgrqUH+59moWHiSORCs+6fqLoJlwYYfEkwxrySLa2nedbzEds0F3wQD4OShwpn5TG@lists.infradead.org
X-Gm-Message-State: AFq9FYIkbHadvFIStjV9qkHVBSQhqImwyCHmgwaa4HSa7F1u8+OnitZZ
	TtCkBtYaYqwFVLtIsBd9SruzZiw5MLm0t6fzxgZNgi8qfiWVQ/1J5m3UAv+cc2QKbAVElFw85YP
	tlnSK4jYnznq5RQ23pDZ3Jg++IWOTOj1zHk2sICpJfoOXK/wIpCfTUI3bsBvAqru9SuBQ+Hi7Sh
	Pw6M6Cy23Ilfz+mTyiLbqhlLSRa3j8EuOBxoUcp1H99VS3MRsCoZmc
X-Gm-Gg: AYBFou3jzaVl+oAoUz3bmjByEr56mAhn46M0jDiPf6XRNzKJFHA5ELdcBnZtRcXJs9/
	YehWIntMiIudPSEAN6E9BJSi0blkJOU9aJ55HY1NSWgRsmcr+KnNwBJjdq8fZNnJfih78VxbaEP
	EMMWly73qaeCdFWzZy54JOyljZPA7NooeIQDmazTAJaFzGS/8HkVqoHXIwrA==
X-Received: by 2002:a05:690e:bc1:b0:675:37b1:931a with SMTP id 956f58d0204a3-6790a0c3183mr2138145d50.12.1791435931780;
        Wed, 07 Oct 2026 22:05:31 -0700 (PDT)
X-Received: by 2002:a05:690e:bc1:b0:675:37b1:931a with SMTP id
 956f58d0204a3-6790a0c3183mr2138134d50.12.1791435931363; Wed, 07 Oct 2026
 22:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260922130653.357615-1-andersson@kernel.org> <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
In-Reply-To: <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 10:35:20 +0530
X-Gm-Features: AclHuK8ljan6yYkSfeVW4C8TVoEvGkyXaktUQeB7YpkfdtcH9wriLsHpMlMeAII
Message-ID: <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <andersson@kernel.org>, arm <arm@kernel.org>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac7249f cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=9s7x0yUzlkJ0pj1vzNoA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMCBTYWx0ZWRfXzOknpnsKlkMY
 OnL8Rp/sMJQ+j8dGum/ZiiOKgboAWVwEA4WYjHkvoz3YLcR2H0YZ2L3Eb+cDAZLSUjt9OtFB521
 6OgpfwM3EfDklbS0TdezthfK/mSjcCw=
X-Proofpoint-GUID: tF9HkQkhZVndf7UpLOp8lf6ei0mjHqw-
X-Proofpoint-ORIG-GUID: tF9HkQkhZVndf7UpLOp8lf6ei0mjHqw-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMCBTYWx0ZWRfX+lDcbhJCj9tO
 u5g6ozwc5FkOs1e5bg6XNXJkPURlAtqMpaqpyEOZBgYLA45AaU2gnFrwCMsrqyGtnd/wt2NKFys
 hhW8IohZVKPMvdJvPhQ0LUDE6eC6lRegdmef8ZNoWwrpKE5JFrbtioVxrdknDtjO4KyjGADej+y
 MujctiWPVhRh27yNoWr1DVqRKIQq61CVbuAnvnYbu/VEpAdorIJXkPqs/sf3hS9pTldy6pt5pCK
 UFQoTuVi2Kbiq91qEozZax5hWOvI9uwds7Tl86l2yX/67z3EJbsQidkqoJenZ1FR0Rr1SlAM9dj
 /NTRtS1WOhFsF1NLd3m/3jWboE1QvCzOahsb3m5xPMKgAsks8GMx7uyWnT3Asm+GDbyJlayBGw8
 SJ/BPO3R+uTmVXP04WpNNflXUdhbZVpHRG6/lRdVyE34llVpusuzzpa+2GeVG/SvpZ+dbH0zv5x
 FULzBzWzakkN86p3uqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_220536_314955_33E40274 
X-CRM114-Status: GOOD (  21.04  )
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

Hi Arnd,

Coming back to work today after vacation.

On Sat, Oct 3, 2026 at 3:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> > The following changes since commit cee9395acd8043be0644b25c34bfa86623f2=
b935:
> > ----------------------------------------------------------------
> > Qualcomm driver fixes for v7.3
> >
> > All clients was migrated from the Qualcomm SCM PAS API to the Qualcomm
> > PAS API in v7.3, remove the now unused direct API.
> >
> > ----------------------------------------------------------------
> > Sumit Garg (1):
> >       firmware: qcom_scm: Remove SCM PAS wrappers
>
> Hi Bjorn and Sumit,
>
> I was running a little behind on the fixes merges, sorry about that.
>
> As it's getting a little late for 7.3, I would suggest skipping this
> one patch as it is a bit large and is a cleanup rather than a fix.
>
> I would instead merge this directly for 7.4 but still take the other
> ones for 7.3. Let me know if there is some reason I missed why this
> needs to be in 7.3 after all.

I agree it's pretty late for v7.3. I am fine for v7.4 if Bjorn is able
to keep the dependencies sorted.

-Sumit

